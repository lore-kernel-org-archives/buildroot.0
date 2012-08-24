From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Fri, 24 Aug 2012 11:22:31 +0100
Subject: [Buildroot] gdbserver with external crosstool
In-Reply-To: <20120824113418.18b14077@skate>
References: <CAJkQPOknYkU=jGjpS2B+b+DUYLNPq6NX-muxC04BBSKbbhGcLA@mail.gmail.com>
 <20120824113418.18b14077@skate>
Message-ID: <CAJkQPOkhtpvxS4eq2tUNx0TKOvgUvFJkZawMdzwTy-GkMkeBOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 August 2012 10:34, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Thu, 23 Aug 2012 09:45:35 +0100,
> Aras Vaichas <aras.vaichas@gmail.com> a ?crit :
>
>> I've got a question about building gdbserver when an external
>> toolchain is selected.
>>
>> in toolchain/gdb/Config.in:
>>
>> config BR2_PACKAGE_GDB_SERVER
>>         bool "Build gdb server for the Target"
>>         depends on !BR2_TOOLCHAIN_EXTERNAL
>>         help
>>             Build the gdbserver stub to run on the target.
>>             A full gdb is needed to debug the progam.
>>
>> Why doesn't Buildroot build gdbserver when an external toolchain is selected?
>
> Because for external toolchains, we assume that the gdbserver must be
> provided by the external toolchain, together with the cross-gdb.

OK, I think I see my confusion here. I'm new to using gdb and I didn't
realise there was a cross-gdb (that runs on the host). I thought that
gdb transferred machine-agnostic debug information via the network
connection therefore I could use any gdb.


> There are two reasons:
>
>  1. Most pre-built external toolchains available out there provide both
>     their own cross-gdb and gdbserver, so it makes sense to use them.

OK, I will rebuild my external toolchain to include gdbserver and gdb.


>> So why doesn't Buildroot allow me to copy over the gdbserver that I
>> built within Buildroot?
>
> I'm confused again. Can you explain what you're doing exactly? In the
> previous paragraph, you precisely said that there was an option to copy
> gdbserver to the target filesystem, and now you're saying that there
> isn't such an option. Are you talking about two different
> configurations maybe?

I have used Buildroot to create a cross toolchain .config. Then I used
that configuration to build an external toolchain which I refer to in
Buildroot (`make clean; make` is quicker, etc). Target is 486, host is
686.

Sorry, I was confused between the two gdb executables. Since both my
target and host are x86, it wasn't obvious to me that one was
different.

Thank you for the help.

Aras Vaichas
