From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Nov 2014 12:55:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: fix build error without
 OpenSSL support
In-Reply-To: <1416087173-21595-1-git-send-email-jkrause@posteo.de>
References: <1416087173-21595-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141116125513.1fac7eae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 15 Nov 2014 22:32:53 +0100, J?rg Krause wrote:
> Version 0.10.33 of nodejs introduced a bug which prevents us from building
> nodejs without OpenSSL support. The bug is reported upstream:
> https://github.com/joyent/node/issues/8676
> 
> This bug caused some build errors:
>   * http://autobuild.buildroot.net/results/0bf/0bf17bf710db051d491123482c90f2f72810804b/
>   * http://autobuild.buildroot.net/results/e1f/e1fb34818ff1167aa008b4011befb9fd14c81293/
> 
> and more...
> 
> nodejs can be build with shared linking to an external OpenSSL library (by
> setting `--shared-openssl`) or with static linking to the bundled OpenSSL
> library.
> 
> With this patch nodejs is build with static linking to the bundled OpenSSL
> library in case no OpenSSL package is selected.

I don't think this is the right fix. We don't want to use the bundled
OpenSSL library, that's contrary to what we do in the rest of Buildroot.
The proper fixes are either fixing the bug that prevents nodejs from
building without OpenSSL, or make nodejs select unconditionally OpenSSL.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
