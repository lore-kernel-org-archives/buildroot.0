From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:30:56 +0100
Subject: [Buildroot] [PATCH v3 4/8] package/mariadb: fix potential error
 message in sysv startup script
In-Reply-To: <20200204012200.7273-4-bluemrp9@gmail.com> (Ryan Coe's message of
 "Mon, 3 Feb 2020 17:21:56 -0800")
References: <20200204012200.7273-1-bluemrp9@gmail.com>
 <20200204012200.7273-4-bluemrp9@gmail.com>
Message-ID: <875zfcq7en.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > In order to check if the initial database needs created, the startup
 > script calls ls -1 $MYSQL_LIB | wc -l to check the number of files in
 > the directory. If the directory does not exist, an error is printed.
 > We fix this by redirecting stderr to /dev/null for the ls call.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 > ---
 > Changes v2 -> v3:
 >   - separate changes into seperate patches (suggested by Thomas)

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
