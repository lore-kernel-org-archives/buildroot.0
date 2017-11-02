From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Thu, 2 Nov 2017 14:40:27 -0700
Subject: [Buildroot] [PATCH v3] qt5: remove Qt Quick dependency on opengl
In-Reply-To: <20171102210137.GD30054@scaer>
References: <1509655079-27158-1-git-send-email-joshua.henderson@microchip.com>
 <20171102210137.GD30054@scaer>
Message-ID: <946ee87f-2ece-5b90-b364-e334aa36bc37@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/2017 02:01 PM, Yann E. MORIN wrote:
> Joshua, All,
> 
> On 2017-11-02 13:37 -0700, Joshua Henderson spake thusly:
>> Qt Quick should no longer depend on opengl, and instead fallback to the limited
>> functionality software renderer as a replacement [1] when not available. This
>> also pulls in an upstream qt5declarative 5.10 patch [2], replacing an existing
>> one, to qt5 5.6.3 and 5.9.2 to fix no-opengl builds.
> 
> Arg, no, we do not want to backport the upstream patch to the 5.6.3
> branch, because they are not under the same license.
> 
> Please keep the one we have for 5.6.3. To avoid this issue in the
> future, you may add a comment in its commit log that explains why it is
> not an upstream backport.

Now, there's some dots I didn't connect. Good call.

Josh
