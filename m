From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 Apr 2018 00:50:15 +0200
Subject: [Buildroot] [PATCH v4 02/11] package/llvm: enable target variant
In-Reply-To: <20180401224607.6c7e3722@windsurf>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-3-valentin.korenblit@smile.fr>
 <20180401224607.6c7e3722@windsurf>
Message-ID: <f0e4d00d-090b-7b78-7d49-5dc391242630@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-04-18 22:46, Thomas Petazzoni wrote:
>>  # * LLVM_ENABLE_CXX1Y: Compile with C++1y enabled OFF
>>  #   Enable C++ and C++11 support if BR2_INSTALL_LIBSTDCPP=y
>>  HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_CXX1Y=$(if $(BR2_INSTALL_LIBSTDCPP),ON,OFF)
>> +LLVM_CONF_OPTS += -DLLVM_ENABLE_CXX1Y=$(if $(BR2_INSTALL_LIBSTDCPP),ON,OFF)
> This time, this line makes sense (for the target LLVM).

 Actually, no. I assume that LLVM_ENABLE_CXX1Y enables C++11 features, but
LIBSTDCPP can still be on for gcc <= 4.8 which has no or little support for C++11.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout@mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
