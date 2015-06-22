From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Jun 2015 13:57:32 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <7f746aa9c68a301002cdca28b6cb3f51@openmailbox.org>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>
 <5578B394.1010503@mind.be> <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
 <5579E9EF.4070402@mind.be> <0d88f0bd848eeb62c868dc2d5dffe496@openmailbox.org>
 <55870F2F.4080700@mind.be> <4fd6c4c54bc90972d20b6f04b62b227e@openmailbox.org>
 <CAHXCMMJWjiKVCi-vjWftDgAxq7JDN+You3Go-NCvQVS81AC1Cw@mail.gmail.com>
 <7f746aa9c68a301002cdca28b6cb3f51@openmailbox.org>
Message-ID: <CAHXCMM+-eyJRSa5c8WAtqptC0MTbJNBb4bZdhBBaY3yxYvAauw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Jun 22, 2015 at 1:26 PM, C?dric Marie
<cedric.marie@openmailbox.org> wrote:
> Le 2015-06-22 12:50, Samuel Martin a ?crit :
>>>>
>>>> - a first patch that removes the export of VERBOSE, with the commit log
>>>> explaining how it breaks cmake projects;
>>
>>
>> Does this mean that the VERBOSE env. var. should now be handled by the
>> cmake-infra?
>
>
> No, you can still build with "make VERBOSE=1" and CMake will take it into
> account.

Not really convenient :(
AFAICS, VERBOSE is not an official env. var. altering Buildroot's
behavior, unlike V [1].

If VERBOSE should only be set for cmake-based package, in addition to
globally unexport it, I'd prefer:
- either fix the cmake infra to keep the same behavior from the user
point of view;
- or update the doc.

I prefer the 1st option.

> There is nothing to change in cmake-infra.
>
> The patch only prevents from systematically exporting VERBOSE when empty,
> which has a specific meaning for CMake - intentional or not, I don't know.

I think it is intentional (given [2] and the number of occurences of
"\<VERBOSE\>" in the cmake code base ;-]).


[1] http://nightly.buildroot.org/#make-tips
[2] http://www.cmake.org/Wiki/CMake_FAQ#Is_there_an_option_to_produce_more_.27verbose.27_compiling.3F

Regards,

-- 
Samuel
