From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 22:43:13 +0200
Subject: [Buildroot] [PATCH v2 1/2] openvpn: remove polarssl crypto
 backend option
In-Reply-To: <1463232828-2957-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463232828-2957-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160515224313.7d703e9d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 May 2016 10:33:47 -0300, Gustavo Zacarias wrote:
> Now that we need to bump openvpn to version 2.3.11 for security fixes
> the time has come to remove the polarssl option.
> Add legacy handling explaining the situation:
> PolarSSL 1.2.x can coexist with mbedTLS 2.x+, but OpenVPN requires
> PolarSSL/mbedTLS 1.3.x (the transition branch) >= 1.3.8 but doesn't
> build/work with the 2.x series. And PolarSSL/mbedTLS 1.3.x can't coexist
> with mbedTLS 2.x on the same target.
> So, unfortunately, openssl is now the only option (until libressl
> arrives) which means no more backend options in general.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> Change for v2: remove legacy handling for openssl case.

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
