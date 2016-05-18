From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 May 2016 00:06:36 +0200
Subject: [Buildroot] [PATCH v2] supertuxkart: new package
In-Reply-To: <ce50871b-7e0d-d540-6b08-cbb0a4a8fea3@mind.be>
References: <1463159188-1564-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <ce50871b-7e0d-d540-6b08-cbb0a4a8fea3@mind.be>
Message-ID: <d6b49dc2-a15a-09f5-a9d4-a23f87df757e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/18/16 23:52, Arnout Vandecappelle wrote:
> On 05/13/16 19:06, Ezequiel Garcia wrote:
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> --
>> Changes from v1 -- thanks, Arnout!
>>   * Made fribidi optional
>>   * Made the bluez5_utils optional, which simplifies dependencies
>>   * Disable Wii only if bluez5_utils is disabled
>>   * Fixed dependencies inherited from OpenAL
>>   * Added a patch to remove -I/usr/X11R6/include from bundled irrlicht-based
>> engine
>>
>> No changes regarding Freetype, because latest v0.9.1 release
>> does not use it.

  One more thing: it fails to build on musl. I tried a quick patch to fix the 
musl build but that wasn't sufficient, so I propose to exclude it on musl. 
Mention that explicitly in the commit log. It's a good idea to build-test it 
with a static toolchain as well (e.g.
http://autobuild.buildroot.net/toolchains/configs/br-arm-full-static.config ).


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
