From: Mario Rugiero <mrugiero@gmail.com>
Date: Tue, 18 Apr 2017 09:36:29 -0300
Subject: [Buildroot] [PATCH 1/2] package: protobuf: bump to v3.2.0.
In-Reply-To: <b1c79629-4a22-a0a3-727d-7331e95bee0a@mind.be>
References: <20170417172225.20472-1-mrugiero@gmail.com>
 <b1c79629-4a22-a0a3-727d-7331e95bee0a@mind.be>
Message-ID: <CAKKQwLRFmnDPHSBGo=xb=4y8p4j69BoJCxDSS5F1kSxGF_sdCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
thanks for taking the time to review my patchset.
I build tested python-protobuf, so I already added that to the commit
message in my copy.
I don't see the patch applied, but it might build now with the changes
you mention, so I'm going to try building for PPC and SPARC without
the patch.
If it succeeds, I'll go ahead and remove the AUTORECONF step and the patch.
I'll get back to you soon.

Cheers,
Mario.

2017-04-18 9:08 GMT-03:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Mario,
>
>  Thanks for your contribution! I have a few comments on it. Would you care to
> fix these issues and resubmit? Thanks!
>
> On 17-04-17 19:22, mrugiero at gmail.com wrote:
>> From: "Mario J. Rugiero" <mrugiero@gmail.com>
>>
>> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
>> ---
>>  package/protobuf/protobuf.hash | 2 +-
>>  package/protobuf/protobuf.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
>> index b681650a1..21dda69ca 100644
>> --- a/package/protobuf/protobuf.hash
>> +++ b/package/protobuf/protobuf.hash
>> @@ -1,2 +1,2 @@
>>  # Locally calculated
>> -sha256 f5b3563f118f1d3d6e001705fa7082e8fc3bda50038ac3dff787650795734146 protobuf-v3.0.0.tar.gz
>> +sha256 2a25c2b71c707c5552ec9afdfb22532a93a339e1ca5d38f163fe4107af08c54c protobuf-v3.2.0.tar.gz
>> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
>> index 72930c1fe..b2c6427fa 100644
>> --- a/package/protobuf/protobuf.mk
>> +++ b/package/protobuf/protobuf.mk
>> @@ -7,7 +7,7 @@
>>  # When bumping this package, make sure to also verify if the
>>  # python-protobuf package still works, as they share the same
>>  # version/site variables.
>
>  See the above comment: have you checked and tested python-protobuf? If so,
> please specify explicitly in the commit message.
>
>> -PROTOBUF_VERSION = v3.0.0
>> +PROTOBUF_VERSION = v3.2.0
>>  PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
>
>  This is not really related to your patch, but bumping the version is the
> perfect occasion to fix it: upstream also have an uploaded tarball (at
> https://github.com/google/protobuf/releases/download/v3.2.0/protobuf-cpp-3.2.0.tar.gz
> ) which already contains the configure script, which would allow us to drop the
> AUTORECONF. Well, except that patch 0001 modifies configure.ac so we still need
> to autoreconf. However, it's possible that that change isn't needed anymore - I
> see something about atomics in the release notes of 3.1.0.
>
>  Oh, and if that patch *is* still needed, it would be nice to send it upstream.
>
>  If you do change the _SITE, you'll also have to update python-protobuf to use
> the python tarball. So this is fairly complicated, so completely OK if you
> choose not to do it.
>
>  Regards,
>  Arnout
>
>>  PROTOBUF_LICENSE = BSD-3-Clause
>>  PROTOBUF_LICENSE_FILES = LICENSE
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
