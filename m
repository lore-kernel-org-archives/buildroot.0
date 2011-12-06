From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Dec 2011 19:09:26 +0100
Subject: [Buildroot] [PATCH] netsnmp: bump to 5.7.1 LTS
In-Reply-To: <dc31ce84ed5d15142ad8641869a5bedb@zacarias.com.ar> (Gustavo
 Zacarias's message of "Tue, 06 Dec 2011 09:20:41 -0300")
References: <1323164603-5503-1-git-send-email-luca@lucaceresoli.net>
 <ef682c5dfbfcc25c3eaec14233e080a5@zacarias.com.ar>
 <4EDDF849.7020607@comelit.it>
 <dc31ce84ed5d15142ad8641869a5bedb@zacarias.com.ar>
Message-ID: <87liqpr2qx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> Digging up found that bad mojo with closedir() and uclibc was
 Gustavo> to blame.  It's already been reported and a patch available at
 Gustavo> http://sourceforge.net/tracker/?func=detail&aid=3436528&group_id=12694&atid=312694
 Gustavo> Tested working so add up the patch, respin and we're good to
 Gustavo> go.  Regards.

Thanks, but I don't think that's the culprint as closedir() in uClibc
checks for NULL pointers (and have done so for 10 years).

int closedir(DIR * dir)
{
        int fd;

        if (!dir) {
                __set_errno(EBADF);
                return -1;
        }

        ..
}

-- 
Bye, Peter Korsgaard
