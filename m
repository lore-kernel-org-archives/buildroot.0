From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 20 Oct 2014 15:43:49 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-19
In-Reply-To: <54450D12.4020807@imgtec.com>
References: <20141020063015.87BD21017EC@stock.ovh.net>
 <54450BD8.1020206@imgtec.com> <54450D12.4020807@imgtec.com>
Message-ID: <CAGduivxvwBqVUy9XFNQoWoZ-W_MdHw_pt5DPB7Q=qA61ONZ3dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, Oct 20, 2014 at 3:24 PM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> On 10/20/2014 02:19 PM, Vicente Olivert Riera wrote:
>>
>> Dear all,
>>
>> On 10/20/2014 07:30 AM, Thomas Petazzoni wrote:
>>>
>>> Build statistics for 2014-10-19
>>> ===============================
>>>
>>>          mips |            modem-manager-1.4.0 | NOK |
>>>
>>> http://autobuild.buildroot.net/results/39e437786cdeec0c3d41c1ff6201cc4f907d0f73/
>>>
>>
>> this fails to build because Perl-XML-Parser is not installed in the
>> autobuilder host...
>>
>> checking for XML::Parser... configure: error: XML::Parser perl module is
>> required for intltool
>>
>> ...which is weird because Perl-XML-Parser is a direct dependency of
>> intltool, and intltool seems to be present in the autobuilder host...
>>
>> checking for intltool >= 0.40.0... 0.50.2 found
>>
>> Anyway..., should we add host-intltool to MODEM_MANAGER_DEPENDENCIES?
Avahi fails too because of this dependencies, and I have no idea at
how Perl works, but from the output of the configure of intltool, it's
using the perl binary of my host system. I'm not sure that was the
idea. And as such, if you have libxml-parser-expat in your system, it
works, otherwise, you're screwed.

Also, from what I've seen so far, if I force inttool to uses the perl
binary that buildroot compiled and installed in the host directory, it
won't find XML::Parser. I tried forcing it's install somewhere else
but to no success. Eventually, it finds it, but fails with the
following message:
output/host/usr/lib/perl5/5.20.1/XML/Parser.pm line 18. BEGIN
failed--compilation aborted at
[...]/host/usr/lib/perl5/5.20.1/XML/Parser.pm line 22. Compilation
failed in require at -e line 1.
Francois ?
>>
>> Best regards,
>
>
> Ok, I didn't realized that modem-manager already has host-intltool in its
> the dependencies, and that makes host-libxml-parser-perl to be installed. So
> now I don't understand why the autobuilder fails :/
>
>
> --
> Vicente Olivert Riera
> Graduate Software Engineer, MIPS Processor IP
> Imagination Technologies Limited
> t: +44 (0)113 2429814
> www.imgtec.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
