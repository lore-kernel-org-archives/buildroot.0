From: Erik Andersen <andersen@codepoet.org>
Date: Tue, 16 Jan 2007 17:04:48 -0700
Subject: [Buildroot] Loop in Config.in Dependencies caused by
	CAIRO/LIBGTK2/XORG
In-Reply-To: <45AD61D8.4070706@atmel.com>
References: <45AD61D8.4070706@atmel.com>
Message-ID: <20070117000448.GA7782@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed Jan 17, 2007 at 12:38:00AM +0100, Ulf Samuelsson wrote:
> Setting BR2_PACKAGE_LIBGTK2 will select BR2_PACKAGE_CAIRO
> Setting BR2_PACKAGE_CAIRO will select BR2_PACKAGE_XORG
> but BR2_PACKAGE_LIBGTK2 depends on BR2_PACKAGE_XORG
> This will cause a loop in the dependencies.
> 
> We can make BR2_PACKAGE_CAIRO depend on BR2_PACKAGE_XORG,
> or we can make BR2_PACKAGE_LIBGTK2 select BR2_PACKAGE_XORG.
> 
> Both fixes will break the loop (I tried)
> 
> What is the best way (Personally I think the latter)?

I've made BR2_PACKAGE_LIBGTK2 select BR2_PACKAGE_XORG.
Thanks for reporting the problem.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
