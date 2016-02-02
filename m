From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Tue, 2 Feb 2016 18:43:17 -0300
Subject: [Buildroot] [PATCH] package: aespipe: add host variant
In-Reply-To: <20160201200235.6cba4eb2@free-electrons.com>
References: <1454341047-14412-1-git-send-email-ariel@vanguardiasur.com.ar>
 <20160201200235.6cba4eb2@free-electrons.com>
Message-ID: <56B122F5.9000002@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

El 01/02/16 a las 16:02, Thomas Petazzoni escribi?:
> Dear Ariel D'Alessandro,
> 
> On Mon,  1 Feb 2016 12:37:27 -0300, Ariel D'Alessandro wrote:
>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>> ---
>>  package/Config.in.host         |  1 +
>>  package/aespipe/Config.in.host | 10 ++++++++++
>>  package/aespipe/aespipe.mk     |  1 +
>>  3 files changed, 12 insertions(+)
>>  create mode 100644 package/aespipe/Config.in.host
> 
> Can you give a justification as to why we would want to add aespipe as
> a host package ? We generally try to limit the number of host packages
> we add to package/Config.in.host, so it's good to include a
> justification as to why it is a good idea to include aespipe as a
> menuconfig-selectable host package.

The justification is pretty much what Arnout said:

""
Post-image scripts may want to encrypt the resulting image with aespipe
(and decrypt it in the update tool on the target), so it is useful to
have the host version and to be able to select it in the configuration.
""

In fact, that's exactly why I added host-aespipe to one of my projects.
Is this enough to include it as a host package?

Thanks!

-- 
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
