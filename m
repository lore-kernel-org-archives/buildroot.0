From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 19 Dec 2006 14:31:40 +0100
Subject: [Buildroot] [PATCH] kexec package
In-Reply-To: <20061218190131.GO2778@ibawizard.net>
References: <20061218190131.GO2778@ibawizard.net>
Message-ID: <20061219133140.GB16563@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 18, 2006 at 08:01:31PM +0100, Petr Stetiar wrote:
>Attached patch adds kexec package to buildroot. Kexec is a tool to load a
>kernel for warm reboot and initiate a warm reboot.

There were a number of shortcomings in your patch
- The version you used had no s390 support
- toolchain/patch-kernel.sh $(KEXEC_DIR) package/kexec/ kexec-*.patch
  forgot to escape the asterisk
- it had a typo "__" instead of the proper "_" in the .mk
- it didn't uninstall itself from the target in kexec-clean

Put short, i rebased that diff to add arm support against the debian
version and redid/fixed the shortcomings. Please test if it still does
what it is intended to do (it should ;).

Thanks
