From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 22:28:49 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/nss-myhostname: Add package
In-Reply-To: <CAB2nKc-MykyOLQpa3P3DiBpQ3nPucg9TeTNL-k3RbMyOBieDOQ@mail.gmail.com>
 (Vincent Prince's message of "Mon, 28 May 2018 21:06:32 +0200")
References: <1527496298-29730-1-git-send-email-vincent.prince.fr@gmail.com>
 <1527496298-29730-2-git-send-email-vincent.prince.fr@gmail.com>
 <87muwkymjh.fsf@dell.be.48ers.dk>
 <CAB2nKc-MykyOLQpa3P3DiBpQ3nPucg9TeTNL-k3RbMyOBieDOQ@mail.gmail.com>
Message-ID: <87wovnv81q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Prince <vincent.prince.fr@gmail.com> writes:

 > Things are not clear on nss-myhostname usage, you can check at
 > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=756224 discussion
 > and also this commit
 > http://git.nomeata.de/?p=libnss-myhostname.git;a=commit;h=5104d7f0045df55ee8be526e8c84078750e1e0ed

Ok. I guess it depends on what you want. The original intention seems to
be purely as a fallback (so at the very end), but "files"
(E.G. /etc/hosts) normally has preference over DNS, and this is
basically an alternative to /etc/hosts so I can see the reasoning for
having it right after files.

In other words, both options are OK by me, but PLEASE document the
reasoning (and those URLs above) in the commit message, thanks.

-- 
Bye, Peter Korsgaard
