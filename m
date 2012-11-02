From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 02 Nov 2012 12:35:27 +0100
Subject: [Buildroot] [PATCH v2] fs/common: Create initial console device
In-Reply-To: <CAG2jQ8iMdCZ6RC5zW6vyuQscDNJgpECyxG++4rD4J_q7q06TYQ@mail.gmail.com>
References: <1351765685-8128-1-git-send-email-markos.chandras@gmail.com>
 <5092F5E0.80704@mind.be>
 <CAG2jQ8iMdCZ6RC5zW6vyuQscDNJgpECyxG++4rD4J_q7q06TYQ@mail.gmail.com>
Message-ID: <5093AFFF.6020302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/12 12:32, Markos Chandras wrote:
>>> >>  +PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1
>> >
>> >
>> >    The last three entries are missing (start, inc, count). Also, there should
>> >  be a $(sep) at the end of the line; otherwise, any subsequent entries are
>> >  appended at the end of the line.  (This will probably be the last line in
>> >  the table anyway, because the fs/ tree is included at the end of Makefile,
>> >  but we shouldn't rely on that).
>> >
> Do I really need these 3 numbers (start, inc, count)? The static file
> in  target/generic/device_table_dev.txt
> is not using them for the console device.

  It is:
/dev/console    c       666     0       0       5       1       -       -       -


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
