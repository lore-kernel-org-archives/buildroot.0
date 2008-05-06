From: Christian SCHWARZ <christian.schwarz@st.com>
Date: Tue, 06 May 2008 09:23:15 +0200
Subject: [Buildroot] link to busybox
In-Reply-To: <d6cda7730805052216v18ea7bd1l7681744d84d78b13@mail.gmail.com>
References: <547821.98673.qm@web94103.mail.in2.yahoo.com>
	<d6cda7730805052216v18ea7bd1l7681744d84d78b13@mail.gmail.com>
Message-ID: <48200763.6090600@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The respawn problem typically is not related to a specific shell, but 
either to a misconfiguration of the /etc files (especially rc.S) or, 
more probable, missing /dev/tty??
You might want to check those messages.
In my case, I had to add several special devices by hand, not added by 
buildroot (and I also replaced all the files in /etc with a single rc.S 
one, which resolved several other problems). The platform is an ARMv6 board.

cheers,
Christian

Thiago A. Corr?a wrote:
>>  I am using buildroot for an arm board.
>>
>>  Is it common to have all my executables as links to busybox?
> 
> Yes, that's how busybox works, it's a single binary file for all the
> tools, so it shares code and reduces total size.
> 
>>  The issue I am facing is that I am not able to get the shell prompt. It keeps on respawning the getty when I try to login.
>>
> 
> I don't use arms, but AVR32 instead. I had a similar issue a while
> back and it was something to do with bash, once I removed bash from
> the build, everything worked ok. You might want to try that.
> 
> Kind Regards,
>    Thiago A. Correa
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
