From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Oct 2018 23:35:48 +0200
Subject: [Buildroot] Update the current date using ntp.
In-Reply-To: <CANQCQpZA_Xgjx+pKvZXp97VYvwk4M0M=PhaEUQQqu40QjV4_iQ@mail.gmail.com>
References: <CALtfCQaov7R68HfvZtNOse+SGu9Y8vihS=4xgixjtjE__VXkkQ@mail.gmail.com>
 <CANQCQpZA_Xgjx+pKvZXp97VYvwk4M0M=PhaEUQQqu40QjV4_iQ@mail.gmail.com>
Message-ID: <4f85764f-4677-56bb-01f0-46def72c3d9b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/10/18 18:57, Matthew Weber wrote:
> Oscar,
> 
> On Mon, Oct 15, 2018 at 11:48 AM Oscar Gomez Fuente
> <oscargomezf@gmail.com> wrote:
>>
>> Hi everyone,
>>
>> I'm using ntp from buildroot 2018.02.5 in a Rapberry Pi 3B+ HW
>> platform. These are the packages selected from: Target packages ->
>> Networking applications
>>
>> ntp
>> ntpd
>> ntpdate
>>
>> The problem is that ntpd takes around 300 seconds to update the
>> current date. Is there any way to speed up this process? I have to
>> wait until the date is updated before doing my tasks and it is very
>> annoying to wait around 300 seconds.
>>
> 
> By default NTP is going to take a period of time to sync as the clock
> will be way out of check > 1000 sec.  Most distros use ntpdate or the
> new ntpd -q to get the initial time jammed in and then start ntpd to
> maintain.

 I believe chrony does all this automatically. I've used chrony on boards
without battery-backed RTC and the time is correct when I log in, without any
magic added by me.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
