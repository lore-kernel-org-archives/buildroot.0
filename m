From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 1 Oct 2018 09:20:50 -0500
Subject: [Buildroot] [PATCH v2 2/2] support/scripts/pkg-stats: URL check
 using threads
In-Reply-To: <CANQCQpaGuW6BNFdxR=btL+YnufQke9PzUOojX63PAFZ9OZEqxw@mail.gmail.com>
References: <1537544157-2992-2-git-send-email-matthew.weber@rockwellcollins.com>
 <5baf10d51c63b_62ce3fdd0e04334832349@ultri5.mail>
 <CANQCQpaGuW6BNFdxR=btL+YnufQke9PzUOojX63PAFZ9OZEqxw@mail.gmail.com>
Message-ID: <CANQCQpbkqmPX3x3q9Ff1ZnqjHBL1X3oOiEOQDwNYimyixtWy9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Mon, Oct 1, 2018 at 9:05 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Ricardo,
>
> On Sat, Sep 29, 2018 at 12:42 AM Ricardo Martincoski
> <ricardo.martincoski@gmail.com> wrote:
> >
> > Hello,
> >
> > On Fri, Sep 21, 2018 at 12:35 PM, Matt Weber wrote:
> >
> > [snip]
> > > +def check_url_status_worker(url, url_status):
> > > +    if url_status != "Missing" and url_status != "No Config.in":
> > >          try:
> > > -            url_status_code = requests.head(pkg.url, timeout=5).status_code
> > > +            url_status_code = requests.head(url, timeout=5).status_code
> >
> > In order to avoid false timeouts for slow hosts, or hosts with a high load, or
> > limited internet connection, or slow servers ... I think 30 seconds is a better
> > timeout here.
>
> Sure.
>
> >
> > >              if url_status_code >= 400:
> > > -                pkg.url_status = "Invalid(%s)" % str(url_status_code)
> > > +                return "Invalid(%s)" % str(url_status_code)
> > >          except requests.exceptions.RequestException as e:
> >
> > There is a warning from flake8 for this line. Please fix it in previous patch.
>
> I'm not seeing any output from flake8.  To be sure the tool is
> working, I changed something syntax wise in the script and I get a
> flake8 err/warning.  Are there options you're calling it with?
>

Got it.  My flake8 install was messed up and after switching machines
I see the unused warning.

Matt
