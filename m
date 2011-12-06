From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 06 Dec 2011 09:20:41 -0300
Subject: [Buildroot] [PATCH] netsnmp: bump to 5.7.1 LTS
In-Reply-To: <4EDDF849.7020607@comelit.it>
References: <1323164603-5503-1-git-send-email-luca@lucaceresoli.net>
 <ef682c5dfbfcc25c3eaec14233e080a5@zacarias.com.ar>
 <4EDDF849.7020607@comelit.it>
Message-ID: <dc31ce84ed5d15142ad8641869a5bedb@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06.12.2011 08:11, Luca Ceresoli wrote:

>> NAK.
>> The 5.7 series (up to 5.7.1) fails miserably with a segfault on 
>> powerpc.
>
> Thanks for your information.
>
> Did you report this to the net-snmp mailing list to get help and,
> hopefully, a fix?
> It's disappointing that all buildroot users must stick to an old
> version of a package because it's not working in some configurations.
>
> Luca

Digging up found that bad mojo with closedir() and uclibc was to blame.
It's already been reported and a patch available at 
http://sourceforge.net/tracker/?func=detail&aid=3436528&group_id=12694&atid=312694
Tested working so add up the patch, respin and we're good to go.
Regards.
