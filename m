From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 20 Sep 2015 10:05:50 +0100
Subject: [Buildroot] [PATCH v2 1/1] squeezelite: new package
In-Reply-To: <201509200852.t8K8q68h024815@ms-omx03.plus.so-net.ne.jp>
References: <201509200852.t8K8q68h024815@ms-omx03.plus.so-net.ne.jp>
Message-ID: <55FE76EE.10508@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

This patch should be v3 because the previous one was v2.

On 20/09/15 09:52, kei-k at ca2.so-net.ne.jp wrote:
[snip]

> +comment "squeezelite needs a toolchain w/ wchar, threads, mmu
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU

It seems you missed part of my comments in the previous email. This 
should look like this:


comment "squeezelite needs a toolchain w/ wchar, threads"
	depends on BR2_USE_MMU
	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

Regards,

Vincent.

[snip]
