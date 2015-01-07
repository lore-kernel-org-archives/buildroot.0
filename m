From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 6 Jan 2015 20:43:03 -0500
Subject: [Buildroot] [PATCH v2] linux: make custom versions and patches
	exclusive
In-Reply-To: <1420583119-30111-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1420583119-30111-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <CANxTyt4spLPozy+88j5rgcA_JKjL7W2gmD8UOC6pLj3f80SJjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien,

On Tue, Jan 6, 2015 at 5:25 PM, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:
> When using a custom kernel (custom tarball, repository or local tree),
> we're using the OVERRIDE_SRCDIR internally, which means we do not apply
> patches. Since this is the expected behavior, show the
> LINUX_KERNEL_PATCH option only when using a vanilla kernel.

Forgive me if I'm missing something obvious, but - when I look at
linux.mk, I see the LINUX_SITE_METHOD set to "local" only when
BR2_LINUX_KERNEL_CUSTOM_LOCAL is set.  Aren't the custom git and
custom hg selections setting the method to "git" and "hg"
respectively?  Patches can't be applied to the results of a tarball
gotten from somewhere other than kernel.org?

Danomi -
