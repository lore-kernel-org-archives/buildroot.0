From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 14 Oct 2015 15:07:15 +0100
Subject: [Buildroot] [PATCH] mplayer: needs zlib
In-Reply-To: <561E5F04.9020607@zacarias.com.ar>
References: <1444730313-34190-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151013225708.3aa5e0aa@free-electrons.com>
 <561E5F04.9020607@zacarias.com.ar>
Message-ID: <561E6193.1030208@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On 10/14/2015 02:56 PM, Gustavo Zacarias wrote:
> On 13/10/15 17:57, Thomas Petazzoni wrote:
> 
>> While this solution is simple, I am not sure if this is the right one.
>> It is in fact perfectly possible to build mplayer without zlib, by
>> doing:
>>
>> +MPLAYER_CONF_OPTS += --disable-decoder=apng --disable-encoder=apng
>> --disable-decoder=tdsc
>>
>> So in fact, zlib is only needed for two decoders/encoders in the ffmpeg
>> code. However, it is not really clear to me how to handle this
>> properly: there is one configure script at the top-level directory, and
>> then another one in the ffmpeg/ directory. And it is really the ffmpeg
>> encoders/decoders that have this zlib requirement (and probably
>> others?).
>>
>> So, simple solution is to make zlib mandatory (which is reasonable:
>> zlib is small, and probably already part of most systems). However, I
>> wonder if there are not some other dependencies for certain
>> encoders/decoders.
>>
>> Bernd, Gustavo, do you have some suggestions ?
> 
> Hi Bernd, Thomas, Vicente.
> Both apng and tdsc are on the same family of codecs, they're basically
> animated-image formats, apng being animated png, and tdsc being a form
> of animated jpeg.
> Since in general we don't require any special deps for mplayer (and it
> doesn't require them most of the time) i'd say being able to build
> without zlib would be desirable, specially since these formats are
> unlikely to normally be used via mplayer (they probably weren't an
> available feature with 1.1.x)
> So using an autodep on zlib seems better IMO.

and why not disable apng and tdsc unconditionally? As you said, "these
formats are unlikely to normally be used via mplayer", so if someone
needs support for them, a future patch could do the work.

Regards,

Vincent.

> Regards.
