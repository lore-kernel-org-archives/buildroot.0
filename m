From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Sep 2013 12:57:32 +0200
Subject: [Buildroot] [PATCH 4 of 4 RFC] Config.in files: unify comments
 of toolchain option dependencies
In-Reply-To: <a7cea7dd647ea16661bf.1379494897@argentina>
References: <patchbomb.1379494893@argentina>
 <a7cea7dd647ea16661bf.1379494897@argentina>
Message-ID: <CAAXf6LWbCWMA2ofRSx4bdLyLsLYnaVfoBJupejSKLUsWqKYoZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Sep 18, 2013 at 11:01 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> This patch lines up the comments in Config.in files that clarify which toolchain
> options the package depends on.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---

In connman, there is a vague mentioning about 'resolver' support:

comment "connman needs a toolchain with IPv6, WCHAR, threading and
resolver support"
        depends on BR2_UCLIBC_VERSION_0_9_32 || \
                !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS


I guess there must be some linke with uclibc 0.9.32, but does anyone
know more? Is this still correct?
In this patch I just took over the 'resolver' string, but it seems odd anyway.

Thanks,
Thomas
