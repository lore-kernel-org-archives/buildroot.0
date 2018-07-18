From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed, 18 Jul 2018 22:18:55 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-07-17
In-Reply-To: <20180718060040.E770E208FF@mail.bootlin.com>
References: <20180718060040.E770E208FF@mail.bootlin.com>
Message-ID: <20180718201855.GC21354@australia>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Jul 18, 2018 at 08:00:40AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2018-07-17, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> ===============================
> 
> Build failures related to your packages:
> 
>       mipsel |             perl-net-ssh2-0.69 | http://autobuild.buildroot.net/results/6ee18e7dd17f168c52f79e49cb5e94cf3aa3df1a
> 

Problem here is the configuration of libssh2 with a non-openssl backend, which I
had not tested.

The log seems to offer a suggestion on how to allow gcrypt as backend, which I
have yet to try. And for mbedtls there is no suggestion, so likely not
supported.

I need some more time to investigate this and propose a fix. Personally I'm only
interested in the openssl backend, so another approach is to restrict it to
that.
In that case I wonder how to achieve it: should I select both LIBSSH2 and
LIBSSH2_OPENSSL and OPENSSL itself?
Or should I make the entire perl-net-ssh2 depend on openssl and libssh2_openssl
before making it visible?

Thanks,
Thomas
