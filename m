From: Martin Hicks <mort@bork.org>
Date: Mon, 28 Mar 2011 16:08:13 -0400
Subject: [Buildroot] Strange hang while executing commands
In-Reply-To: <AANLkTim0HL1qMmkS7tNaYmoEeyg4pZXLr3FztfAVPoXq@mail.gmail.com>
References: <AANLkTikvXk7qzFov-25Xu_MmUXdkYMdwkKkGtsRzhUwA@mail.gmail.com>
	<87sjvm75ik.fsf@macbook.be.48ers.dk>
	<AANLkTim0HL1qMmkS7tNaYmoEeyg4pZXLr3FztfAVPoXq@mail.gmail.com>
Message-ID: <AANLkTimU_B32K7xWQCNGpMgiaFHiPp-G7ehNmctPz_e-@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 17, 2011 at 3:49 PM, Martin Hicks <mort@bork.org> wrote:
> On Thu, Feb 17, 2011 at 3:47 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>> "Martin" == Martin Hicks <mort@bork.org> writes:
>>
>> ?Martin> Hi,
>> ?Martin> Does anyone have any clues where I might start looking for the reason
>> ?Martin> behind commands within the procps package just hanging?
>>
>> Hanging or crashing?
>
> Hang.

I finally got around to investigating this further.  If I enable the
"build packages with debugging symbols' the problem goes away :(

If I interrupt the processes with gdb and step, I see that it's
looping through the same function over and over, for some reason.  I
did try procps-3.2.8, to no avail.

Any ideas?
Thanks,
mh

(gdb) step
Single stepping until exit from function init_Linux_version,
which has no line number information.
0x0ffc9104 in _restgpr_30_x () from /lib/libproc-3.2.8.so
(gdb)
Single stepping until exit from function _restgpr_30_x,
which has no line number information.
0x0fe5f540 in vsscanf () from /lib/libc.so.6
(gdb)
Single stepping until exit from function vsscanf,
which has no line number information.
0x0fe4d4b0 in sscanf () from /lib/libc.so.6
(gdb)
Single stepping until exit from function sscanf,
which has no line number information.
0x0ffc8ba8 in init_Linux_version () from /lib/libproc-3.2.8.so
(gdb)
Single stepping until exit from function init_Linux_version,
which has no line number information.
0x0ffc9104 in _restgpr_30_x () from /lib/libproc-3.2.8.so
(gdb)



-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
