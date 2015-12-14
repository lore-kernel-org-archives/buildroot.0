From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 17:08:27 -0300
Subject: [Buildroot] [PATCH] gnutls: needs argp-standalone for
	musl/uclibc
In-Reply-To: <20151214210508.42d636b4@free-electrons.com>
References: <1449248499-2852-1-git-send-email-gustavo@zacarias.com.ar>
 <20151213223250.77e3dbfb@free-electrons.com>
 <566EF951.3010500@zacarias.com.ar>
 <20151214210508.42d636b4@free-electrons.com>
Message-ID: <566F21BB.9000103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/12/15 17:05, Thomas Petazzoni wrote:

>> Hi.
>> It's still crywrap failing, hence tools.
>
> Well the failing config I'm pointing to has BR2_PACKAGE_GNUTLS_TOOLS
> disabled, but BR2_PACKAGE_GNUTLS enabled.
>
> Thomas

crywrap isn't part of tools in the gnutls sense, it's only so in the 
buildroot package sense/option.
Essentially --disable-crywrap is a no-op in gnutls, that's what the 
patch fixes, so it was never disabled.
Regards.
