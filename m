From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 22:30:19 +0100
Subject: [Buildroot] [PATCH] rtptools: needs RPC support
In-Reply-To: <87pp18q14y.fsf@dell.be.48ers.dk>
References: <1443009479-8481-1-git-send-email-Vincent.Riera@imgtec.com>
 <87pp18q14y.fsf@dell.be.48ers.dk>
Message-ID: <560319EB.8080003@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On 23/09/15 22:25, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>
>   > rtptools needs a toolchain with RPC support, otherwise it will fail with
>   > an error message like this one:
>
>   > host2ip.c:13:38: fatal error: rpcsvc/ypclnt.h: No such file or directory
>   >  #include <rpcsvc/ypclnt.h>   /* YP */
>
> Hmm, are you sure?
>
> I just did a test build here with a toolchain without RPC support:
>
> find output/staging/usr -name ypclnt.h
>
> But it still built. I do see that rpctools itself contain that header
> file:
>
> find output/build/rtptools-1.20 -name ypclnt.h
> output/build/rtptools-1.20/nt/include/ypclnt.h
> output/build/rtptools-1.20/nt/include/rpcsvc/ypclnt.h
>

We were discussing about this in the IRC during this afternoon, and 
checked that it actually builds with toolchains without RPC. I 
highlighted the issue using a toolchain which is a bit special.
I then marked my patch as deferred few hours ago, but now I'm going to 
mark it as rejected. I will keep investigating about this because is 
very weird that the rtptools itself has the headers but my toolchain is 
not able to find them.

Regards,

Vincent.
