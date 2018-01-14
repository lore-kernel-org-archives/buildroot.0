From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jan 2018 22:39:40 +0100
Subject: [Buildroot] [PATCH] package/bash: add /bin/bash to /etc/shells
In-Reply-To: <20180113112507.GE3226@scaer> (Yann E. MORIN's message of "Sat,
 13 Jan 2018 12:25:07 +0100")
References: <1515666444-13390-1-git-send-email-romain.naour@smile.fr>
 <20180111171357.GA3559@scaer> <20180112095938.621ff1bc@windsurf.lan>
 <20180112173510.GA3226@scaer> <20180112212157.2541d33f@windsurf.lan>
 <20180113112507.GE3226@scaer>
Message-ID: <87a7xgw25f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,
 > On 2018-01-12 21:21 +0100, Thomas Petazzoni spake thusly:
 >> On Fri, 12 Jan 2018 18:35:10 +0100, Yann E. MORIN wrote:
 >> > On 2018-01-12 09:59 +0100, Thomas Petazzoni spake thusly:
 >> > > On Thu, 11 Jan 2018 18:13:57 +0100, Yann E. MORIN wrote:  
 >> > > >     grep -E '^/bin/bash$' $(TARGET_DIR)/etc/shells >/dev/null 2>&1 \  
 >> > > grep -q ?  
 >> > 
 >> > -q is not POSIX. Redirecting is guaranteed to always work.
 >> 
 >> Knowing that Buildroot only supports Linux hosts, do we care about -q
 >> not being POSIX ?

 > Linux host does not mean GNU extensions. For example, Alpine is using
 > busybox, so not GNU grep...

 > But I back-pedal on this, it seems that -q has been added to POSIX now:
 >     http://pubs.opengroup.org/onlinepubs/9699919799/utilities/grep.html

And busybox grep DOES support -q.

-- 
Bye, Peter Korsgaard
