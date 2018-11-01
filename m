From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Nov 2018 15:14:11 +0100
Subject: [Buildroot] [PATCH 1/1] linux-firmware: bump version and fix
 hash
In-Reply-To: <CAK4VdL0_csVF1ZpA=J+V1J9o1v-1DRUNn9P6p7XymG_SEonn2A@mail.gmail.com>
References: <20180926223806.12704-1-nunes.erico@gmail.com>
 <87mus2vkos.fsf@dell.be.48ers.dk>
 <CAK4VdL0mu+5Od73gU4T7dRLVRHior7gYg6NQ3+bNKms9P5R=EQ@mail.gmail.com>
 <20181003194023.GA2383@scaer>
 <CAK4VdL0_csVF1ZpA=J+V1J9o1v-1DRUNn9P6p7XymG_SEonn2A@mail.gmail.com>
Message-ID: <20181101141411.GU28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erico, All,

Adding Thomas in Cc, for he may need to act on existing patches ;-)

On 2018-10-28 08:59 +0100, Erico Nunes spake thusly:
[--SNIP--]
> Ok so I finally tested this out and it seems to be due to two reasons:
> 
> 1) The tar version in Fedora is 1.30, Buildroot host-tar is 1.29. I
> can reproduce it using 1.30, if I force a host-tar build before
> getting the source, it works.

I was pretty sure we had added support for download dependencies
recently, and added host-tar as needed, but it seems this series
of mine is still pending:

    https://patchwork.ozlabs.org/project/buildroot/list/?series=43275

> 2) This is a bit unsupported and I had already tried disabling it
> before reporting, but I was experimenting with system-side pigz
> (something like https://askubuntu.com/a/62608), this seems to affect
> it too.

So, we should now detect if gzip is acceptable for use by Buildroot, and
if it is not, build our own host-gzip.

Does pigz isdentifies itself as pigz, or does it really impersonate
gzip? If the former, then it will be easy to detect, but if the latter,
it becomes more complex (we'd have to compress a wellknown blob and see
if the compressed stream matches what we expect.)

> Maybe it is because I switched to testing with 'make source' rather
> than a full build to test it quickly?

Yes, see the series I referenced above, as well as its cover letter:
    http://lists.busybox.net/pipermail/buildroot/2018-May/221176.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
