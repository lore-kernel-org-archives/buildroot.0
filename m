From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 21:53:51 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-16
In-Reply-To: <20170517212023.478bd24a@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 17 May 2017 21:20:23 +0200")
References: <20170517062751.2CBF020789@mail.free-electrons.com>
 <20170517212023.478bd24a@free-electrons.com>
Message-ID: <877f1f5kfk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 17 May 2017 08:27:51 +0200 (CEST), Thomas Petazzoni wrote:

 >> successes : 251
 >> failures : 10 

 > This is getting better, and better, and better. We're down to 3.83% of
 > failures for yesterday. Today will be a little bit worse, with
 > currently 4.19% failures. But we're really below 5% of failures, which
 > is very good.

Indeed, very nice!

 >> x86_64 | oracle-mysql-5.1.73 | NOK |
 >> http://autobuild.buildroot.net/results/61074b69b81cd5c17a7f74dc1f7b31f3fc35fd8a
 >> | ORPH

 > protocol.cc:27:40: error: narrowing conversion of ''\37777777776''
 > from 'char' to 'uchar {aka unsigned char}' inside { } [-Wnarrowing]
 >  static uchar eof_buff[1]= { (char) 254 }; /* Marker for end of fields */

 > I searched the oracle-mysql Git history, and I believe I might have a
 > fix for this.

Hmm, isn't it just the cast that is wrong? E.G. it should be (uchar) 254

-- 
Bye, Peter Korsgaard
