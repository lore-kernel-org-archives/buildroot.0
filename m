From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Jul 2015 13:56:39 +0200
Subject: [Buildroot] [PATCH 1/1] angularjs: new package.
In-Reply-To: <20150720114915.GA3641@zenon.in.qult.net>
References: <1437129876-5158-1-git-send-email-ignacy.gawedzki@green-communications.fr>
 <CAGduivxBdvS75bNaHo_AmWaZZZ4x0qqbr27kVPbLrvjay05uJQ@mail.gmail.com>
 <20150718191650.6f34b9e5@free-electrons.com>
 <CAAXf6LV0DdDu=OjP-fgmtM9VQdf6OzmV4zNzHRmeRtqOYs8Nag@mail.gmail.com>
 <20150720114915.GA3641@zenon.in.qult.net>
Message-ID: <CAAXf6LU1=Ydf4idyXgi5A8vik6JKeyjoerp_uaLPdTfQybommg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 20, 2015 at 1:49 PM, Ignacy Gaw?dzki
<ignacy.gawedzki@green-communications.fr> wrote:
> On Sat, Jul 18, 2015 at 09:25:41PM +0200, thus spake Thomas De Schampheleire:
>> >> > +define ANGULARJS_INSTALL_TARGET_CMDS
>> >> > +       for f in $(strip $(ANGULARJS_FILES)); do        \
>> >> > +               $(INSTALL) -m 0644 -D $(@D)/$$f         \
>> >> > +               $(TARGET_DIR)/var/www/$${f%.min.js}.js; \
>>
>> Here, IIUC, you are installing foo.min.js as foo.js. I think this is
>> misleading: it is common practice in web development to actually
>> include minified files as .min.js instead of renaming this, so I don't
>> see why it should be done here.
>
> Hi Thomas,
>
> I think it should be up to the web server to decide whether the
> version served is minified or not.  Otherwise you'd have to make the
> JS application choose the actual version, while it makes no functional
> difference.  Therefore, the application includes some .js file and
> ignores whether it is minified or not.
>
> I got my inspiration from the jquery package, which installs a
> minified version as jquery.js.  Do you think I should install minified
> files as .min.js anyway?

Hmm, ok, then it makes sense to be consistent.

I wonder if anyone ever would like to have the unminified files on
target, and how we'd call them if the minified is installed as .js.
But that's probably a problem to be solved then...

/Thomas
