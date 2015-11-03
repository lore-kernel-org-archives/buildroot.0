From: Benno <b.schweikert@prosystems.de>
Date: Tue, 3 Nov 2015 15:58:54 +0100
Subject: [Buildroot] Poco 1.6.1 with glib for Raspberry Pi
In-Reply-To: <20151103151918.1aa989ea@free-electrons.com>
References: <56388339.6080904@prosystems.de>
 <20151103151918.1aa989ea@free-electrons.com>
Message-ID: <5638CBAE.9040700@prosystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

> Can you give us a sample program that allows us to reproduce the
> problem ?

I tried to make an example program...

#include <string>

int main(int argc, char **argv)
{
     std::string example = "This is a test string";

     return 0;
}

I linked the Poco libraries Foundation, Util and Net. Then I compiled it.
When the linker is invoked I got the same errors again....


If this help you more in my Program I mostly use Poco for Time Stuff 
like get the current time or
the regex for parsing strings and also threads

> Is the sentence incomplete? "for the FPEnvironment" doesn't really mean
> anything.
I thought its an important info that I use glibc.


Am 03.11.2015 um 15:19 schrieb Thomas Petazzoni:
> Dear Benno,
>
> Thanks for your report! See below for those additional questions to
> better understand what's going on and hopefully help resolve the issue.
>
> On Tue, 3 Nov 2015 10:49:45 +0100, Benno wrote:
>
>> I got Problems with POCO 1.6.1 compiles with the 'unbundled' Flag for
>> Raspberry Pi.
>>
>> When I compile my program with the POCO libs from buildroot this error
>> appear:
>>
>>
>> |..../libPocoFoundation.so: undefined reference to `_pcre_ucd_stage1'
>> |||....|/libPocoFoundation.so: undefined reference to
>> `_pcre_ucd_records' |||....|/libPocoFoundation.so: undefined reference
>> to `_pcre_ucp_gentype' |||....|/libPocoFoundation.so: undefined
>> reference to `_pcre_ucd_stage2'|
> Can you give us a sample program that allows us to reproduce the
> problem ?
>
>> after a short internet search I found out that other people have the
>> same problem too but no clear solution to solve it.
>>
>> I made sure that the packages pcre, zlib, expat and sqlite are checked
>> in buildroot then the program run through compilation,
>> but when I execute it on the pi the program returns with the error:
>>
>> 'undefined symbole: _prce_ucd_stage1'
>>
>> Did I missed something important?
> Same here, can you give a sample program that allows us to reproduce ?
>
>> For my kernel I use glibc, for the FPEnviroment.
> Is the sentence incomplete? "for the FPEnvironment" doesn't really mean
> anything.
>
> Best regards,
>
> Thomas

-- 
Mit freundlichen Gr??en / with best regards


Benno Schweikert


ProSystems GmbH, Am Forst 26, D-74889 Sinsheim Eschelbach
Tel.: ++49(0)7265 / 911239
Amtsgericht Mannheim HRB 341508
Gesch?ftsf?hrer: Dipl.-Ing. Dietmar Nikolaj, Michael Doll, Ralf Rostock

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151103/68e4e03b/attachment.html>
