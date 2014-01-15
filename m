From: Mike Zick <minimod@morethan.org>
Date: Wed, 15 Jan 2014 06:59:05 -0600
Subject: [Buildroot] [PATCH] luarocks: fix compilation on 64bits
In-Reply-To: <87zjmxv3up.fsf@dell.be.48ers.dk>
References: <1389775370-29415-1-git-send-email-francois.perrad@gadz.org>
 <874n55wo2y.fsf@dell.be.48ers.dk>
 <CAB0FRstP_cEdRwAKjiF2qVYicWP9XaVQKbPFL9oFUaiqM5Wq7w@mail.gmail.com>
 <87zjmxv3up.fsf@dell.be.48ers.dk>
Message-ID: <20140115065905.538e66a5@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jan 2014 13:14:54 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  >> What about BR2_PREFER_STATIC_LIB (for both CFLAGS and LDFLAGS
>  >> lines)?  
> 
>  > native Lua modules/extensions are always shared lib.  
> 
> Ok, committed with a reworded commit message, thanks.
>

"Close enough" for the purposes of Buildroot.

Both modules and extensions in either native Lua or as
objects from foreign languages (such as "C") may be 
statically linked into the Lua interpreter.

The process and changes required are well documented,
but would probably be impractical to automate in the
build system.

So the answer for the BR2_PREFER_STATIC_LIB question is:
"Not supported within the Buildroot system."
or on a positive note:
"Buildroot only supports Lua externals as dynamic libraries."

Mike
