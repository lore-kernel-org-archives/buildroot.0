From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Sep 2013 21:06:43 +0200
Subject: [Buildroot] [PATCH 3 of 4 RFC] manual: add section about
 depending on toolchain options
In-Reply-To: <20130919061052.3679c035@skate>
References: <patchbomb.1379494893@argentina>
 <89b40887c8268e316399.1379494896@argentina>
 <CAAXf6LXD_7jt42XAG_XgKWKi_+te40hgYNd4mTLbmCDMxfG0QA@mail.gmail.com>
 <20130918183414.45e6a247@skate>
 <CAAXf6LWmH2xtBe_P-P+1HJhndDM1BhHZcgJzu9o7JrfwjtwWVg@mail.gmail.com>
 <20130918194042.302e9afe@skate> <5239E6E5.4000401@zacarias.com.ar>
 <20130918195925.1884c0a7@skate> <5239EB63.2090203@zacarias.com.ar>
 <20130918201812.3e08d883@skate> <523A21D5.6040005@mind.be>
 <20130919061052.3679c035@skate>
Message-ID: <523B4B43.4060208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/13 06:10, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 18 Sep 2013 23:57:41 +0200, Arnout Vandecappelle wrote:
>
>>> Yes, we probably want to have the choice between building static only,
>>> static + shared, or shared only, default to shared only. Currently,
>>> when !BR2_PREFER_STATIC_LIB, we build both the shared and static
>>> variants, which takes time because it requires building everything
>>> twice, once with -fPIC, once without.
>>
>>    I don't think the static + shared option really makes sense, does it?
>> The only use case I can think of is when you want a proprietary
>> executable to link statically in order to speed up start time.
>
> Well, there might be cases were you would want to link some of your
> applications statically, against some libraries, but not some others.
>
> I've had such a case with a customer project using Buildroot: they have
> limited flash space (16 MB, if I recall), in which they were trying to
> put many many things. Some shared libraries were used by only one
> executable, so linking them statically actually reduced the overall
> storage consumption.

  Hm, good use case. Yes, that does make a static+shared option valid.


  Regards,
  Arnout

>
> But I agree it shouldn't be the default.
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
