From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 11:20:29 -0300
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <20150315221813.173a36e2@free-electrons.com>
References: <20150315221722.3645eb35@free-electrons.com>
 <20150315221813.173a36e2@free-electrons.com>
Message-ID: <5508382D.7080008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/15/2015 06:18 PM, Thomas Petazzoni wrote:

> There was also another issue, on alsa-lib:
> 
>   http://autobuild.buildroot.org/results/b6c/b6c5dc4c4bfed3e23ebb698bc3b262798fcbedd9/build-end.log
> 
> .libs/error.o: In function `_snd_lib_error_default':
> error.c:(.text+0xca): undefined reference to `___emutls_get_address'
> .libs/error.o: In function `_snd_lib_error_set_local':
> error.c:(.text+0x15a): undefined reference to `___emutls_get_address'
> error.c:(.text+0x166): undefined reference to `___emutls_get_address'

This seems to be a problem with the internal toolchain since we don't
enable tls for gcc, whereas ADIs toolchain does.
Which may point to alsa-lib requiring toolchain tls support.
Regards.
