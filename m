From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Oct 2017 20:16:09 +0200
Subject: [Buildroot] [PATCH] .gitignore: ignore output*
In-Reply-To: <20171021160404.579c29af@windsurf>
References: <20171021140108.24066-1-gael.portay@savoirfairelinux.com>
 <20171021160404.579c29af@windsurf>
Message-ID: <4d795892-5e4d-b1b6-fff5-2548874665af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-10-17 16:04, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 21 Oct 2017 10:01:08 -0400, Ga?l PORTAY wrote:
>> During development, it is often practical to have many output
>> directories.  The output directory is easily specified with O=<output>
>> though is it useful to have a convention of 'output...' e.g.
>> "output-rpi", "output-rpi2", and "output-rpi3-64".
>>
>> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
>> ---
>>  .gitignore | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/.gitignore b/.gitignore
>> index bb02d9f572..ec5768d053 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -1,4 +1,4 @@
>> -/output
>> +/output*
> 
> Not sure this is a good idea, it kind of makes an assumption on how
> people would name their output directories.
> 
> If you're annoyed by your output directories, use make O=../output-rpi2
> instead of make O=output-rpi2, and that's it :-)

 You can also add /output* to .git/info/exclude (this is what I do).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
