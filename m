From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 11 Nov 2015 14:13:16 +0100
Subject: [Buildroot] Kernel patches in Buildroot
In-Reply-To: <56432ED3.7070008@mind.be>
References: <56432809.3000902@synopsys.com> <56432ED3.7070008@mind.be>
Message-ID: <CAGm1_kuAhrYU=Dva6=rxy2m6jH-RDOwxdNz-CtWAphfFYJsY8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 11, 2015 at 1:04 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 11-11-15 12:35, Joao Pinto wrote:
>> Hi,
>> We are designing the procedure to release our software stack based on buildroot.
>> Could you please tell what is the advised method for including a kernel patch
>> set in buildroot? I typically use BR2_LINUX_KERNEL_PATCH where I indicate each
>> patch file. Is there a easier way like using BR2_GLOBAL_PATCH_DIR for example?
>
>  I personally prefer to use a git repository that includes the patches. During
> development, I make a local checkout specified with LINUX_OVERRIDE_SRCDIR; for
> release, I point to the repository (often on gitlab) and specify a tag.
>
>  BR2_GLOBAL_PATCH_DIR and BR2_LINUX_KERNEL_PATCH are basically equivalent, you
> can specify a directory with the latter as well.

You can also create a BSP repository containing patches, configs and
so on and just instruct customers to use BR2_EXTERNAL feature
(http://nightly.buildroot.org/manual.html#outside-br-custom).

Yegor
