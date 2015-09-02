From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Sep 2015 15:07:57 +0100
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <20150902160446.7fbf9ef6@free-electrons.com>
References: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
 <20150902091051.7ee82cf3@free-electrons.com>
 <CANPyyuP-7XUHqJET+UOKEtGS8_N4R0nAFY1tfffrUK5oko5DnA@mail.gmail.com>
 <20150902160446.7fbf9ef6@free-electrons.com>
Message-ID: <55E702BD.5090608@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/02/2015 03:04 PM, Thomas Petazzoni wrote:
> Dear Mike Williams,
> 
> On Wed, 2 Sep 2015 09:50:34 -0400, Mike Williams wrote:
> 
>> It's not just what systemd expects, many packages by default install their
>> systemd-related items to /lib, etc. instead of /usr/lib, so we either have
>> manual fixes to the .mk files for those packages or inconsistencies in
>> where those items go. As an example, I believe rsyslog is passed a special
>> flag setting its systemd install location to /usr/lib, and gpsd is still
>> just installing to /lib/systemd/system.
>>
>> It wouldn't surprise me if most of our systemd users had already merged
>> their directories in their skeleton; I will probably do so soon as well.
> 
> Hum, right, I see. Then maybe Yann's patch is the right answer. In fact
> what I'd like to see in Buildroot is a group of people taking care of
> the systemd-related issues. So if you're willing (with others) to
> tackle that, it would be very useful. If you agree with Yann's patch,
> can you please test it and give your formal Tested-by/Reviewed-by?
> 
> Thanks,
> 
> Thomas
> 

and what about also selecting BR2_ROOTFS_USR_SYMLINKS in systemd's
Config.in?

Regards,

Vincent.
