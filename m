From: Matthew Weber <matt@thewebers.ws>
Date: Thu, 31 Mar 2016 23:04:57 -0500
Subject: [Buildroot] [PATCH v2 2/2] buildroot-test: failure reason regex
	update
In-Reply-To: <20160401055834.5b7b6226@free-electrons.com>
References: <1459468972-31420-1-git-send-email-matt@thewebers.ws>
 <1459468972-31420-2-git-send-email-matt@thewebers.ws>
 <20160401035503.6f83bb24@free-electrons.com>
 <CAFt09wNVPNa0aekpxdhZxOOLRgSdKUZQivMVz195FJhfO9exwA@mail.gmail.com>
 <20160401055834.5b7b6226@free-electrons.com>
Message-ID: <CAFt09wPOrjY0V6Jp3jCD1C084zpExqoS1Jpp88ujN93=ucORCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 31, 2016 at 10:58 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 31 Mar 2016 21:37:30 -0500, Matthew Weber wrote:
>
>> > Really? Did you look at my previous review, where I showed the
>> > different examples I could find, and showed that 3 lines were enough?
>>
>> I did and I haven't figured out why yet
>
> Well, can you show the last 10 lines of your build logs, which require
> 4 lines for the script to detect the failure reason?
>

    ^
futility/cmd_gbb_utility.c: In function 'do_gbb_utility':
futility/cmd_gbb_utility.c:558:5: warning: format '%lli' expects
argument of type 'long long int', but argument 3 has type 'off_t {aka
long int}' [-Wformat=]
     "ERROR: can't malloc %" PRIi64 " bytes: %s\n",
     ^
    CC            futility/ryu_root_header.o
    CC            firmware/stub/vboot_api_stub_static_sf.o
    GEN           gen/futility_static_cmds.c
    CC            cgpt/cgpt_create.o
    CC            cgpt/cgpt_add.o
    CC            cgpt/cgpt_boot.o
    CC            cgpt/cgpt_show.o
    CC            cgpt/cgpt_repair.o
    CC            cgpt/cgpt_prioritize.o
    CC            cgpt/cgpt_common.o
make[2]: *** No rule to make target
'/opt/buildroot_testing/buildroot-test/instance-0/output/build/host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656/build/host/arch/i686/lib/crossystem_arch.o',
needed by '/opt/buildroot_testing/buildroot-test/instance-0/output/build/host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656/build/libvboot_util.a'.
Stop.
make[2]: *** Waiting for unfinished jobs....
    CC            futility/dump_kernel_config_lib.o
package/pkg-generic.mk:195: recipe for target
'/opt/buildroot_testing/buildroot-test/instance-0/output/build/host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656/.stamp_built'
failed
make[1]: *** [/opt/buildroot_testing/buildroot-test/instance-0/output/build/host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656/.stamp_built]
Error 2
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2
make: Leaving directory
'/opt/buildroot_testing/buildroot-test/instance-0/buildroot'


-- 
Thanks,
Matt
