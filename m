From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Jun 2018 06:19:28 +0300
Subject: [Buildroot] Build failure due to the new "cset existence" check
 in the GIT downloader
In-Reply-To: <CAGt4E5tqz2qVVvh26o1pz-S59QXBvw+zkPq2ujJ0e03CVcxVsQ@mail.gmail.com>
References: <CAGt4E5tqz2qVVvh26o1pz-S59QXBvw+zkPq2ujJ0e03CVcxVsQ@mail.gmail.com>
Message-ID: <20180626031928.co7tbnln5swdo3fq@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Markus,

On Mon, Jun 25, 2018 at 04:26:07PM -0700, Markus Mayer wrote:
> Of course GIT *could* check out "master" successfully, if it tried. It
> never tries, because "git rev-parse" doesn't succeed for "master" and
> the download helper bails, assuming that is the right thing to do.

[snip]

> Would it make sense for the download helper to check if the passed in
> "cset" exists as a branch once "rev-parse" returns an error? Or
> perform its check in a different way, so branches are recognized? Or
> try to check out the branch first after the clone operation? It seems
> that the download helper should not artificially abort a build that
> would actually succeed. Right now it's doing exactly that.
> 
> I am not sure what the best solution is, but I don't think the current
> check is correct. What do you think?

The issue of no support for git branches in _VERSION has been discussed at 
length recently. See this detailed summary from Yann, and the rest of that 
thread:

  http://lists.busybox.net/pipermail/buildroot/2018-June/222967.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
