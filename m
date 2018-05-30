From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 May 2018 17:42:32 +0200
Subject: [Buildroot] Buildroot 2018.05-rc3 released
In-Reply-To: <1527674917.2072.2.camel@rovoreed.com> (Mike Davies's message of
 "Wed, 30 May 2018 11:08:37 +0100")
References: <87efhvufjm.fsf@dell.be.48ers.dk>
 <1527599917.2053.2.camel@rovoreed.com>
 <87fu2a7bkq.fsf@dell.be.48ers.dk>
 <1527615682.2053.4.camel@rovoreed.com>
 <87po1e5mev.fsf@dell.be.48ers.dk>
 <1527674917.2072.2.camel@rovoreed.com>
Message-ID: <87tvqp2lqv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Davies <busybox_mail@rovoreed.com> writes:

Please keep the discussion on the buildroot list, thanks.

 >> ?> If I select Python as a package to install on my target, then it
 >> builds
 >> ?> OK - but I don't want Python on my target.
 >> 
 >> ?> For now, I guess a workaround is to select Python, and delete it
 >> in a
 >> ?> pre-image script.
 >> 
 >> That is odd. The presence or not of python for the target shouldn't
 >> have
 >> any effect on host-python. You do not mean python3 for the target, do
 >> you?

 > Yes, sorry, I mean Python3 for the target. I also have ".pyc compiled
 > sources only", core python3 modules??--->?[*] unicodedata module, ?core
 > python3 modules??--->?(none)?

Ok, interesting. Enabling python3 for the target means that our host
python becomes python3, so the certdata2pem.py step in ca-certificates
is executed with host-python3.


>> What Linux distribution/version are you using?

 > The Linux distribution/version I am building on is Fedora Red Hat 25
 > ...

 > [mike at modron ~]$ uname -a
 > Linux modron 4.9.14-200.fc25.x86_64 #1 SMP Mon Mar 13 19:26:40 UTC 2017
 > x86_64 x86_64 x86_64 GNU/Linux

Ok, I'm on Debian. Thomas, you are using Fedora now, right? Can you give
ca-certificates a try?

-- 
Bye, Peter Korsgaard
