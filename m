From: Eial Czerwacki <eial@scalemp.com>
Date: Thu, 10 Jul 2014 17:25:13 +0300
Subject: [Buildroot] ping not working in a glibc based buildroot
In-Reply-To: <20140710161645.1ad0e468@free-electrons.com>
References: <53BD4395.5050306@scalemp.com>	<20140709142242.GK3003@tarshish>	<53BD5452.6030902@scalemp.com>	<53BD55E2.7070507@zacarias.com.ar>	<53BD576F.1060008@scalemp.com>	<53BE83E8.2010906@scalemp.com>	<20140710142322.188e88ed@free-electrons.com>	<53BE887E.7070606@scalemp.com>	<20140710145619.5925fa1b@free-electrons.com>	<53BE8EF2.9000306@scalemp.com>	<20140710153435.6b2ab536@free-electrons.com>	<53BE97D3.5090009@scalemp.com>	<20140710160659.18c3af57@free-electrons.com>	<53BE9FA5.9070002@scalemp.com>
 <20140710161645.1ad0e468@free-electrons.com>
Message-ID: <53BEA249.3020808@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

On 07/10/2014 05:16 PM, Thomas Petazzoni wrote:
> Dear Eial Czerwacki,
>
> On Thu, 10 Jul 2014 17:13:57 +0300, Eial Czerwacki wrote:
>
>> I've added libnss_dns-2.18.so to the img and libresolv.so and it seems
>> to be working.
>> the files are missing because I work in a kinda limited size.
> So you removed them manually? I'd like to understand what happened, to
> fix Buildroot if needed.
>
>> do I need the other libnss_*.so files?
> By default, we only copy libnss_dns (to do DNS resolution) and
> libnss_files (to do /etc/hosts based resolution), and we don't copy the
> other libnss_* libraries, which are used for more advanced name
> resolution that are generally not used on most embedded systems.
>
> See 'man nsswitch.conf' for more details.
>
> Best regards,
>
> Thomas
I see, as I don't use /etc/hosts, I think I don't need libnss_files.

I hope I get it all to work now, thanks a bunch!

Eial.
