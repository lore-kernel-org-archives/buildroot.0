From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sun, 12 Feb 2012 22:41:23 +0200
Subject: [Buildroot] ccache issue with zlib dependency
In-Reply-To: <201202111647.03064.arnout@mind.be>
References: <CAMP44s3eoG9jOoG7Gv_CvyKtG5dPbf+mP-_S7=cB-1LcJBM2hQ@mail.gmail.com>
 <201202111647.03064.arnout@mind.be>
Message-ID: <CAMP44s0U4LsmWu0bA4YFBUNdYS0kYGXAreVhS1faNJ7DQ5bOGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 11, 2012 at 5:47 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Saturday 11 February 2012 00:36:04 Felipe Contreras wrote:
>> Hi,
>>
>> I have a newer version of zlib (1.2.6) on my host system than what
>> buildroot is using (1.2.5), ultimately the build fails because I have
>> enabled ccache, and it uses zlib, and when the older zlib is installed
>> there are missing symbols (ZLIB_1.2.5.2), so ccache doesn't work any
>> more, and everything else fails.
>>
>> I tried to add the zlib dependency to ccache, but the build also fails
>> because apparently host-zlib tries to use ccache.
>
> ?As a workaround, you can add CC="$(HOSTCC_NOCCACHE)" to the build
> commands of host-zlib. ?But I don't particularly like it.
>
> ?Another option is to force ccache to use its bundled zlib, by adding
> ccache_cv_zlib_1_2_3=no to HOST_CCACHE_CONF_ENV.
>
> ?The best option would be to check in support/dependencies if the
> system has a good zlib, and only build host-zlib if it doesn't. ?But
> that's major surgery in the build system again.

How about a ccache wrapper script that checks if ccache is there, and
then runs $@ with that, and if not, just run $@?

-- 
Felipe Contreras
