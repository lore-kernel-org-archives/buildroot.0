From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 24 Nov 2015 10:33:04 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-11-22
In-Reply-To: <565380A0.8070101@openwide.fr>
References: <20151123073012.D78FC101751@stock.ovh.net>
 <565380A0.8070101@openwide.fr>
Message-ID: <56543CE0.6050002@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On 23/11/15 21:09, Romain Naour wrote:
> Hello,
> 
>>       x86_64 |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/964b5909dbac97d56b87e22e5141d62c54eba893/
> 
> commands/toolcontext.c: In function 'create_toolcontext':
> commands/toolcontext.c:1795:10: error: assignment of read-only variable 'stdin'
>     stdin = new_stream;
> 
> This is a musl issue and generally fixed by using freopen(). See [1] [2].
> 
> There is a patch from alpinelinux [3] but I'm wondering if it could be simpler
> to get ride of _reopen_stream() an use freopen() instead.
> 
> Vincente, what do you think ?

you told me in the IRC that this patch could affect other C libraries,
so, my opinion is that it would be better to work with upstream and fix
the problem there, and then backport the fix into Buildroot.

Regards,

Vincent.

> Best regards,
> Romain
> 
> [1]
> https://github.com/doughdemon/fdupes/commit/fe2d8334bfa28ff05fa1a2ffe8555a19b41be0ea
> [2] https://github.com/adrianlopezroche/fdupes/pull/31
> [3]
> http://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.patch?h=v3.2.3
> 
