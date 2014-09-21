From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Sep 2014 21:43:36 +0200
Subject: [Buildroot] [PATCH 02/23 v5] gendoc infra: move manual build
 location into $(BUILD_DIR)/manual
In-Reply-To: <20140921211335.25ce7865@free-electrons.com>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <6434392afa05cfca43f02e7f2e79671fe175f059.1410692670.git.yann.morin.1998@free.fr>
 <20140921211335.25ce7865@free-electrons.com>
Message-ID: <20140921194336.GE4299@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-21 21:13 +0200, Thomas Petazzoni spake thusly:
> On Sun, 14 Sep 2014 13:07:36 +0200, Yann E. MORIN wrote:
> > diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> > index 136f725..e86f872 100644
> > --- a/docs/manual/manual.mk
> > +++ b/docs/manual/manual.mk
> > @@ -1,11 +1,20 @@
> > +$(BUILD_DIR)/$(pkgname):
> > +	$(Q)mkdir -p $@
> 
> Shouldn't we do things in $(BUILD_DIR)/docs/$(pkgname) instead? Even
> though it's unlikely, I'm a bit worried about conflicting names between
> real packages and documentations.

Unlkikely, but I don't mind moving the documents to a sub-dir. I'll do
the change before I respin.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
