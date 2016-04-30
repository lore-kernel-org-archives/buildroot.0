From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 21:13:11 +0200
Subject: [Buildroot] [PATCH] libtommath: add -fPIC
In-Reply-To: <87twijrl81.fsf@dell.be.48ers.dk>
References: <1462005187-32394-1-git-send-email-francois.perrad@gadz.org>
 <20160430145512.34b475dc@free-electrons.com>
 <87twijrl81.fsf@dell.be.48ers.dk>
Message-ID: <20160430211311.215e9c1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 20:43:26 +0200, Peter Korsgaard wrote:

>  > Applied to master, thanks.  
> 
> Hmm, isn't it a bit odd to build a static library with -fPIC?
> 
> But OK, the error message seems to be from trying to link a shared
> library with it.

Well, as you've seen yourself, this static library is then used inside
a shared library, so it has to be built -fPIC.

If you want to build the static library without -fPIC, then the
libtommath package should also provide a shared version of its library,
so that it gets used instead of the static one when linked into a
shared library.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
