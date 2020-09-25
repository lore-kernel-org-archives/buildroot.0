From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 25 Sep 2020 17:05:19 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-09-24
In-Reply-To: <C5WHSEGX6N1N.2D5DWORN9UHJA@dragonstone>
References: <878scy8c8b.fsf@tarshish> <C5WHSEGX6N1N.2D5DWORN9UHJA@dragonstone>
Message-ID: <875z827y00.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xogium,

On Fri, Sep 25 2020, Xogium wrote:
> I wouldn't mind taking a look, but I am not sure what to look for. Archlinux is 
> always having bleeding edge softwares since it is a rolling release, and next to 
> no patching is done to what upstream provides. 
>
> I had a quick look at the libpcap version, which is 1.9.1. It was built on 
> november 13, 2019, and hasn't see any rebuild since. So maybe it is something 
> that host-bison now does that it did not do before? Thanks for the warning. I 
> hope I can be helpful in determining what is going wrong.

The failing line is this (from configure.ac):

    if $YACC -p pcap_ -o /dev/null $srcdir/grammar.y >/dev/null 2>&1; then

What do you see if you run this with $YACC set to the host-bison
produced binary, without /dev/null redirection?

baruch

> On Fri Sep 25, 2020 at 1:57 PM CEST, Baruch Siach wrote:
>> Hi Xogium,
>>
>> On Fri, Sep 25 2020, Thomas Petazzoni wrote:
>> > Autobuild statistics for 2020-09-24
>> > ===================================
>>
>> [...]
>>
>> >     arm      |         libpcap-1.9.1          | NOK | http://autobuild.buildroot.net/results/058e8ec90da3c06e31b31eb94541331cced44db3 |     
>>
>> Your autobuilder reported this error several times over the last few
>> days:
>>
>> http://autobuild.buildroot.net/?reason=libpcap-1.9.1
>>
>> checking for bison... bison -y
>> checking for capable yacc/bison... insufficient
>> configure: error: bison -y is insufficient to compile libpcap.
>> libpcap requires Bison, a newer version of Berkeley YACC with support
>> for reentrant parsers, or another YACC compatible with them.
>>
>> This is most likely triggered by the recent bison version bump (commit
>> f4c89374eaec306). For some reason libpcap does not like host-bison on
>> your machine.
>>
>> Can you take a look?
>>
>> Thanks,
>> baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
