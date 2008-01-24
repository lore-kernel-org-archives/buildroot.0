From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 25 Jan 2008 09:38:46 +1100
Subject: [Buildroot] [Merak Spam 5.26] can't develope any programs	using
	ssl in the root
In-Reply-To: <00c401c85e2a$9de7f140$8119fea9@MingChing>
References: <479802C7.9090108@redtone.com>
	<00c401c85e2a$9de7f140$8119fea9@MingChing>
Message-ID: <20080124223846.GD3397@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 24, 2008 at 09:44:10AM +0800, Ming-Ching Tiew wrote:
> > I wonder what I am doing wrong, I have enabled openssl and included
> > the header in the root, but in the root environment, I can't develope
> > any program which requires openssl, configure will fail with this error
> > ( the example below is tcpdump ) :-
> >
> > configure:12791: checking for SSLeay
> > configure:12833: result: /usr
> > configure:12845: checking for DES_cbc_encrypt in -lcrypto
> > configure:12875: gcc -o conftest -DINET6 -g -O2  -L/usr/lib  conftest.c
> > -lcrypto  ./../libpcap-0.9.5/libpcap.a  >&5
[...]
> 
> I have found a workaround for it, I delete the entire
> 
>    /usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/
> 
> Looks to me like a bug. Since I can proceed now, I am staying with
> this for a while.
