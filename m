From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 22:26:01 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-16
In-Reply-To: <877f1f5kfk.fsf@dell.be.48ers.dk>
References: <20170517062751.2CBF020789@mail.free-electrons.com>
 <20170517212023.478bd24a@free-electrons.com>
 <877f1f5kfk.fsf@dell.be.48ers.dk>
Message-ID: <20170517222601.0c65aecf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 May 2017 21:53:51 +0200, Peter Korsgaard wrote:

>  >> x86_64 | oracle-mysql-5.1.73 | NOK |
>  >> http://autobuild.buildroot.net/results/61074b69b81cd5c17a7f74dc1f7b31f3fc35fd8a
>  >> | ORPH  
> 
>  > protocol.cc:27:40: error: narrowing conversion of ''\37777777776''
>  > from 'char' to 'uchar {aka unsigned char}' inside { } [-Wnarrowing]
>  >  static uchar eof_buff[1]= { (char) 254 }; /* Marker for end of fields */  
> 
>  > I searched the oracle-mysql Git history, and I believe I might have a
>  > fix for this.  
> 
> Hmm, isn't it just the cast that is wrong? E.G. it should be (uchar) 254

Indeed, fixed in
https://git.buildroot.org/buildroot/commit/?id=19e78e509e5e729437d2188b28aee7655340c67d.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
