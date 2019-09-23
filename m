From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Sep 2019 15:31:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: add support for mbedtls
 crypto backend
In-Reply-To: <CAKpO6uHe017t7F34v8mjaCm-6GxpRJEuNX7uvzwSrEycrDd_5w@mail.gmail.com>
References: <20190918110609.7172-1-gliga.mircea@gmail.com>
 <20190918174859.1627727d@windsurf>
 <CAKpO6uFOE2ShN1JupQoiupNF-SVnWzMiJ5x9twcAueGG5p9how@mail.gmail.com>
 <20190923092218.72ad7121@windsurf.home>
 <CAKpO6uHe017t7F34v8mjaCm-6GxpRJEuNX7uvzwSrEycrDd_5w@mail.gmail.com>
Message-ID: <b5004549-c820-11d4-1b5f-a87cfbe084d2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/09/2019 12:22, Mircea Gliga wrote:
> Hi Thomas,
> 
> Sorry for the misunderstanding, I re-read your question.
> 
>> My point was: is it really useful to
>> provide an explicit choice vs. simply selecting a preferred crypto
>> provider automatically, with no explicit choice in Config.in.
> 
> Yes it's useful if for some reason you have multiple backends already
> present: for example one package has a hard dependency on openSSL and I
> want mine to use libssh with mbedTLS. In this case you have to manually
> choose your crypto backend as the default is not suitable for your needs.

 Yes, but the real question then is: why would mbedTLS ever be more suitable for
your needs than openssl (when used as a backend for libssh)?

 I remember there was a patch doing something similar for another package at
some point, and there the explanation was that (IIRC) with gnutls you could use
a crypto token but with openssl you couldn't. So, if there is something like
that at play here as well, please explain it in the commit message.

 Regards,
 Arnout
