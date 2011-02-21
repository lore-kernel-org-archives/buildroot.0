From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 21 Feb 2011 10:02:19 -0600
Subject: [Buildroot] device_table question
In-Reply-To: <AANLkTimh-oHKjexs3L7Ag1-x=R_E+Ha11kkHw4xJLh5-@mail.gmail.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F559B74@EXV1.corp.adtran.com>
	<AANLkTimh-oHKjexs3L7Ag1-x=R_E+Ha11kkHw4xJLh5-@mail.gmail.com>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F55A121@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> I tried your scenario with the following device table line:
> 
> /dev/mybetterdev         c       640     0       0       230     0
>   1       1       10
> 
> which resulted in:
> 
> crw-r----- 1 root root 230, 0 2011-02-20 10:42 /mnt/dev/mybetterdev1
> crw-r----- 1 root root 230, 1 2011-02-20 10:42 /mnt/dev/mybetterdev2
> crw-r----- 1 root root 230, 2 2011-02-20 10:42 /mnt/dev/mybetterdev3
> crw-r----- 1 root root 230, 3 2011-02-20 10:42 /mnt/dev/mybetterdev4
> crw-r----- 1 root root 230, 4 2011-02-20 10:42 /mnt/dev/mybetterdev5
> crw-r----- 1 root root 230, 5 2011-02-20 10:42 /mnt/dev/mybetterdev6
> crw-r----- 1 root root 230, 6 2011-02-20 10:42 /mnt/dev/mybetterdev7
> crw-r----- 1 root root 230, 7 2011-02-20 10:42 /mnt/dev/mybetterdev8
> crw-r----- 1 root root 230, 8 2011-02-20 10:42 /mnt/dev/mybetterdev9

Nope, if the above is a direct paste, nope, that's wrong.  You have
nine devices up there, you asked for 10.
 
> This is what you wanted, right?
> 
> Note that you seem to have forgotten one field in your device table
> lines: I count only 9 fields, while you should have 10 (or is this a
> typeover mistake?)

I must have backspaced through one of the numbers

> 
> The above was tested with Buildroot 2010.05.
> 
> Best regards,
> Thomas

What I did (which works) is:

/dev/mydev   c  666   0   0   254    1   1   1   24

which actually gives 24 devices from 0 - 23 with names mydev[1-24].

As long as it is 100% reproducible, I'm okay with this solution.

Andy
