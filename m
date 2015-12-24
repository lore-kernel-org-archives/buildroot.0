From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 08:30:58 +0100
Subject: [Buildroot] Newbie boot and fs mount question
In-Reply-To: <04294576-64CB-4232-80B7-362A7A7DC2FF@gmail.com>
References: <CA+C+_XSCm9Q1uE7Zg2VcK6xCa3ASEUNFTX=0GF3=KwaUYQWTzQ@mail.gmail.com>
 <20151222210930.7929c662@free-electrons.com>
 <04294576-64CB-4232-80B7-362A7A7DC2FF@gmail.com>
Message-ID: <20151224083058.1cffa502@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mathew Benson,

On Wed, 23 Dec 2015 19:04:05 -0600, Mathew Benson wrote:

> I have a possible dumb question.  I enabled initrd to be linked into
> the kernel, thinking boot time might be faster.  I enabled the
> "remount filesystem" option, thinking that would remount it from the
> hard drive rather than the linked in rootfs.  Is that an incorrect
> assumption?

Yes, it is an incorrect assumption. In Buildroot, if you enable
"initial RAM filesystem linked into linux kernel", then the entire
root filesystem lives in RAM, and we never switch to another on-storage
filesystem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
