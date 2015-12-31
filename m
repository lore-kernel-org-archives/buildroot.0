From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 11:07:45 +0100
Subject: [Buildroot] [PATCH] Config.in: add symbols for
 BR2_HOST_GCC_AT_LEAST_X_Y
In-Reply-To: <20151231103343.31187340@free-electrons.com>
References: <1451522053-2797-1-git-send-email-arnout@mind.be>
 <20151231103343.31187340@free-electrons.com>
Message-ID: <5684FE71.30408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-12-15 10:33, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle (Essensium/Mind),
> 
> On Thu, 31 Dec 2015 01:34:13 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> From: Arnout Vandecappelle <arnout@mind.be>
>>
>> Some host packages need a recent gcc version. Add symbols to Config.in
>> to specify the HOSTCC version. The values are passed through the
>> environment, and this environment is generated in a new support script.
>>
>> Also update the documentation to mention the new symbols.
>>
>> [Thomas: simplify by using only make logic instead of an external
>> shell script.]
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>> v4: Further simplification by Arnout: no post-processing is needed for
>>     4.X versions if we keep the space in "4 9". Also use extended regex
>>     to simplify the sed script a little.
>> v3: Alternative version by Thomas that removes the external shell
>>     script.
>> v2: Use a single environment variable and select statements (Yann)
>>     This makes the shell script ridiculously simple. I've tried to move
>>     it to the Makefile, but then all the additional quoting etc. makes
>>     it complicated again.
>> ---
>>  Config.in                                 | 24 ++++++++++++++++++++++++
>>  Makefile                                  |  9 +++++++++
>>  docs/manual/adding-packages-directory.txt |  7 +++++++
>>  3 files changed, 40 insertions(+)
> 
> I had also thought about keeping the space in the value, but found the
> "subst" wasn't too bad. But well, I agree that your solution further
> simplifies the thing.
> 
> I'm glad we've been able to move from a somewhat complicated and
> convoluted solution (a shell script that generates a list of
> environment variables) to a solution that is in fact completely trivial.

 And that we don't have to generate Kconfig files :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
