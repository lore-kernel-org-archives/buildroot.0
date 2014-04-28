From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Apr 2014 16:18:43 -0300
Subject: [Buildroot] [PATCH 3/6] upstream glibc 2.18/2.19 works fine
 with microblaze
In-Reply-To: <CAPALihO_K2VsaYO9erhFrKZpY9755ACOjsm56O6VvxO9MA6-0Q@mail.gmail.com>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>	<1397382423-4939-4-git-send-email-wbx@openadk.org>	<53553336.2020401@zacarias.com.ar>
 <CAPALihO_K2VsaYO9erhFrKZpY9755ACOjsm56O6VvxO9MA6-0Q@mail.gmail.com>
Message-ID: <535EA993.8080108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/28/2014 04:08 PM, William Welch wrote:

> Greetings,
> 
> When you say BR works fine for microblaze 'on QEMU', could you be more
> specific?  little endian?  mmu? which 'defconfig' did you use with
> buildroot?  Which version of QEMU, what command line?
> 
> I'd like to recreate your working setup and maybe that will give me a
> clue to my troubles here...
> 
> I am trying to use the 'buildroot native toolchain' with a Spartan 6
> little endian microblaze MMU design, but I don't get very far with the
> native toolchain. However, using the older 'external' toolchain boots
> linux fine.
> 
> 
> thanks,
> 
> William

Hi.
It means all relevant buildroot qemu sample defconfigs boot to a login
prompt where you can login and get dhcp working on the emulated network
(if said config has networking).
For microblaze this means big and little endian with MMU, we don't have
a nommu configuration since i've never managed to get that working in a
satisfactory way.
And that's with Waldemar's patches, not as it is right now which broke
those qemu defconfigs when the toolchain was changed to the internal
backend.
I do not know if it's the toolchain to blame and/or some Qemu
limitation, i just know that Waldemar's patches fix it for what i have
at hand (no microblaze hardware, just emulation).
Regards.
