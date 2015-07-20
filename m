From: Ignacy =?iso-8859-2?Q?Gaw=EAdzki?= <ignacy.gawedzki@green-communications.fr>
Date: Mon, 20 Jul 2015 13:49:15 +0200
Subject: [Buildroot] [PATCH 1/1] angularjs: new package.
In-Reply-To: <CAAXf6LV0DdDu=OjP-fgmtM9VQdf6OzmV4zNzHRmeRtqOYs8Nag@mail.gmail.com>
References: <1437129876-5158-1-git-send-email-ignacy.gawedzki@green-communications.fr>
 <CAGduivxBdvS75bNaHo_AmWaZZZ4x0qqbr27kVPbLrvjay05uJQ@mail.gmail.com>
 <20150718191650.6f34b9e5@free-electrons.com>
 <CAAXf6LV0DdDu=OjP-fgmtM9VQdf6OzmV4zNzHRmeRtqOYs8Nag@mail.gmail.com>
Message-ID: <20150720114915.GA3641@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 18, 2015 at 09:25:41PM +0200, thus spake Thomas De Schampheleire:
> >> > +define ANGULARJS_INSTALL_TARGET_CMDS
> >> > +       for f in $(strip $(ANGULARJS_FILES)); do        \
> >> > +               $(INSTALL) -m 0644 -D $(@D)/$$f         \
> >> > +               $(TARGET_DIR)/var/www/$${f%.min.js}.js; \
> 
> Here, IIUC, you are installing foo.min.js as foo.js. I think this is
> misleading: it is common practice in web development to actually
> include minified files as .min.js instead of renaming this, so I don't
> see why it should be done here.

Hi Thomas,

I think it should be up to the web server to decide whether the
version served is minified or not.  Otherwise you'd have to make the
JS application choose the actual version, while it makes no functional
difference.  Therefore, the application includes some .js file and
ignores whether it is minified or not.

I got my inspiration from the jquery package, which installs a
minified version as jquery.js.  Do you think I should install minified
files as .min.js anyway?

Ignacy

-- 
Ignacy Gaw?dzki
R&D Engineer
Green Communications
