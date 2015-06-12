From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:45:09 +0200
Subject: [Buildroot] [PATCH v5 2/3] lutok: new package
In-Reply-To: <20150612213419.15566320@free-electrons.com>
References: <1434063093-14906-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <1434063093-14906-3-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <20150612213419.15566320@free-electrons.com>
Message-ID: <20150612214509.08728a82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jun 2015 21:34:19 +0200, Thomas Petazzoni wrote:

> Both the lutok and kyua packages after --without-atf ? Why so ? You add
> the atf package as the first patch, and then it isn't used in follow-up
> patches ?

Ok, --without-atf is not about ATF support, but about build ATF-based
tests. I've added a comment to explain this.

> > +# liblua uses dlopen when dynamically linked
> > +ifneq ($(BR2_STATIC_LIBS),y)
> 
> ifeq ($(BR2_STATIC_LIBS),)

Actually, I was able to build without adding -ldl, so I'm not sure why
it is needed. We'll see what the autobuilders have to say, unless you
have more details about the specific configuration that was causing
problems.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
