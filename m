Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E3B606D812
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qKDOrRCJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 260A881187;
	Thu,  5 Nov 2026 14:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXqJvcDWSfJs; Thu,  5 Nov 2026 14:20:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 29D978116D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793888400;
	b=Nq3jU+WB9Td4R6ZMGWBo8MJRFVpQv7d0fpQ+R2we+7z1dAzO2dCgr3h5FoYBO8vUlNkv
	 Y4rU0MrCTrAUqu8ET1F3mt0WiMfVxyBqknYQx9lnDf7kAc6xDUjS4f6Dst/qeY44zVRri
	 yXT/fANkfLTiRg2bi/w92ESVGmJ058SWIfrSuyH1npBenv+p40F1kI/ZnVL/FlCkw1NDb
	 0Nu6lDcnTOahmRhmZ8p8nJCLDqQSVyyObfhE5Uw804c1h7HkAcjqkmyAOu1Z5It7Sobmq
	 68zewmwU16dmBAF06s1wroS6OV0iy3iz0akKFaQUtPw+btWmXUZmly0xJzNm4alklgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793888400;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:Date:
	 MIME-Version:Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=p9DIIPJmrpqj23lxfDxb1B7WZvK/x3LyxjJgjx+hW+s=;
	b=KSreqYHzCWn+Qbf+UshbSMMjCIdlCEBtHAOPHvSeZpeOV3XVKg6nMrQQEnJd14X6NxLH
	 BLAfKNi0rFmXX1DVyasn9pVEFql/9y8rIzu7gLkIe0KG8mHeE4FKvq6uR4YWhT7981TfE
	 0mEHwAckqQz32Nn4XR9FjNIhw382UByEQJ1PGgGwFzjuYRPhf8eW4JWAM8CQ2/yPLUgbW
	 uC16vYi1A4axAVAJ8ta6SKVGg4zvUDcbAlNRa1TJvWuI1kEZWL5BBfkJae7YiVfNzBIU+
	 ccn5bgQsyfnk37TZZwkoeQ9GNlmFBZ5BEkZXxWZhP+5fsrOgfaUpn4IUtPfTt1kyItg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793888400;
	bh=p9DIIPJmrpqj23lxfDxb1B7WZvK/x3LyxjJgjx+hW+s=;
	h=Date:To:CC:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qKDOrRCJaQh4iAHhXEYsEPoBUZ2rSM/HWA0BoYBfrtPaV2PXPAwWV+htXaPs5Riky
	 smlkCDv8q88k9ojzSHs5Uh/mLasuz+H+ym3XhU3YsbyjOmyEgPQNutGALnDyoAuWda
	 oWxBQaVW/MZgvEQLPIqVqxwDO/Wl7qGg/X1PIbWnmx+vv4wMgH80iNBUxIrM0XeYj+
	 xP6d16QZLDKmfFQbHOy4qr2bOMfA+DqdI/WRyNDf910e2JPVznVjHd7i5Mrewzu/v6
	 PfWqDPKpUNEPY5TEPgTTFl+P2bYp1oIVRPHdKLYrIrbYifDP5ZLzB1QwggTsQucH7m
	 mLcMw78yvIVDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D978116D;
	Thu,  5 Nov 2026 14:20:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09F58280
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 14:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0730B4088D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 14:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hI-mpNWLghcQ for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 14:19:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D4B9440888
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.154.28;
 helo=mx0b-0002e601.pphosted.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com
 [148.163.154.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4B9440888
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 14:19:56 +0000 (UTC)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5DibhZ531872; Thu, 5 Nov 2026 08:19:55 -0600
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hrrp0gxfy-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2026 08:19:54 -0600 (CST)
Received: from MN0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:52c::30)
 by MW4PR10MB6440.namprd10.prod.outlook.com (2603:10b6:303:218::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:19:49 +0000
Received: from BN1PEPF00018072.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::36) by MN0PR05CA0018.outlook.office365.com
 (2603:10b6:208:52c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 14:19:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00018072.mail.protection.outlook.com (10.167.245.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 14:19:49 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 08:19:32 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 08:19:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 08:19:32 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.75.137])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5EJWcW264649;
 Thu, 5 Nov 2026 08:19:32 -0600
Date: Thu, 5 Nov 2026 08:19:26 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261105-ti-k3-r5-loader-bump-v1-1-ff5486ac1748@ti.com>
X-B4-Tracking: v=1; b=H4sIAG2Q7GoC/yXMTQqDMBBA4avIrDuQRKK0V5EuYjLq2PrDREtBv
 LtRl9/ivQ0iCVOEV7aB0I8jT2OCfmTgOze2hBySwShTaK0sLoyfHMXid3KBBOt1mNHZJjxLU3h
 lFKR0Fmr4f22r9+241j355XzBvh+DGEiJeAAAAA==
X-Change-ID: 20261105-ti-k3-r5-loader-bump-a5fd9726c020
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, "Bryan
 Brattlof" <bb@ti.com>
X-Mailer: b4 0.15.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018072:EE_|MW4PR10MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: a518e954-4559-4477-e302-08df3b47d9d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|56012099006|261022105027099003|261009223027099003|261021121427099003|261021123027099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: fwVzBwA281C8A5qEgSyIo+24xVvsIMTI2Rk8NcIQEU8hkroKQ4FhaYve8XBTaU+d35vEd/YG2tdCcyQuNbBmyQ1S8rcJepjJYzpmnMw2f5D1KF11LQ+qhhDXyD/pykkLuxWbSb3tNUU0bQvbowQcoAx0rFNJJPPleXE+Bi2ROvlFxtL+D0vZLvONafwfTLBiUF1zk4U7h+lfZqcTNUolEvLNrYOY6DcWQee3MOxmfBpIDMkGaeA9TxjpsEZxgrCJ3RxXGzI6AxsBbgZBQnuy2LgYkLLEWDGCNAE5HdRUAouzdgRa/H6ZNBa1lY8LDn0PaLlWQ1Eym+r2vITmPYwsjT2mtBPTsjMnsc65+BbZ/rDxskNSwNryibbUkxr4ofdcmTKZz1n9kM103gvFKExInX5irBrnChF99yJLTCaQtcNDcWi9dzsA7sssSUiqRkyonqizcbLZIqGbqdLz7V/vStxj1oe7d9y9ZQVp06NmUFvNYISgd7ATyhPgy+RGjGu8aMJqDMMcKW9IkiXaxaFy+EJ37hf5DwFkWbWjPUonGFLbVvQH1BMgizP0ArVAMlP3N/gmhWmLuxWa9p5gMcJd03TM+msUTYcCYJJdXFr7SpFqMs0LY6FV8ZsFF9WwSkIP8KbUtFeFrtOUQ8EiMsZc5A==
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(56012099006)(261022105027099003)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fdR2UqrgP0OAYtoeiN0lc6hve8PzPQfk+T9SsLVPu0GjxmEQtw58DLP8EyFfs4LdIuc2m1jZPUgLbTYP9902DQ4mbd0dV+kNbjSIs96feM1d5kfgMzHmPi71TX77eoapIxee2zf3wPu1ihV6QNXEgp7l3P2JTKfkbqBFkvlxN/JE5XvEVAOHa0RpkOPn/U2/lKJjiR0bvJ/MQu1ZnE8zTe2khIt3ziqzKE3Fb4IuGufEqDZ26avejs0q2zyONe+N8ppeYc3fZ1QDF3ovK7lV8EqVMgQyoRfdKyyOBsYZQIYou0TAZZKR1Y4WjMWwEM77tCicGU9njFXVbkM+msCLe1btGmnWFJVJAcQ6grwXrUEQtaZDRCvTEySneFWxBUkH+GHoVUR26BixYnNX9m3Fi8MRdy9Ono4xJ69A8fwgM6K34MgrtPf8XWSsoXFzeMVy
X-Exchange-RoutingPolicyChecked: FFf1PyTy2kp6yr7vZaWxBUHGVAZDDVoTjX6lUkm8oBs2R7nIRVNm3OWZe5GSyNFIzGagnTWJEgdbKuq8E30nfJdXpYExJ7uBOosJwj4aHqBbTeybljrOj92w3fRhTxOs4XnxiNk2ETw9kGA3cnOD8yUbZji1rT7QVhK3Q57t30wis0p79VrhVyAHwxDtPDUTsVlENk40kV0qA5klqF12fGkVNlLTfxMzh7H+47Jb7lQ/1YElfu51QwR6DYL4FBTGh5sWM21UmofS/E+DMSUp3Va+88fgskAlWdBSwEOb5bywVpkSbOUKIsw0MWGFhxTx6pHWh87VIB1MGJW82gdaBA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:19:49.2382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a518e954-4559-4477-e302-08df3b47d9d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6440
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NiBTYWx0ZWRfXxg/hownDjP0u
 jkwmYJFGbo3WnhLFD6+00MUivNqOT813iYtj3KgFHtJJcb4i+LEG8zE2XGxaPwJcGu2G6Gg9mUC
 WWRAZ3f+tYfRMU/BOR1XXETNH53xCSw=
X-Authority-Analysis: v=2.4 cv=MIz1C8Zl c=1 sm=1 tr=0 ts=6aec908a cx=c_pps
 a=UjDdpJjQ9fE5FDPsVaFzsw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=1VxDqnHFAAAA:8
 a=YfCOm-DyAAAA:8 a=sozttTNsAAAA:8 a=ueg-RdMWnJWbJRPsqjUA:9 a=QEXdDO2ut3YA:10
 a=aZ5uHUMKh6B-zo3GvD48:22 a=zQLMK8awuJ6_Hvp-_9Ux:22
X-Proofpoint-ORIG-GUID: VHqVXchuYsoPGF8mngnx21ERCY7uX79u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NiBTYWx0ZWRfXzHxldBJdXVhl
 jimDLXoApRXcCB41x0nCVJl0VLgPMscZ1JVy+fdBLW3duGWvhyqaFxdm62maJ6IPSCKCMWN0XGV
 C/WhNt6qLhErCMClXw/k6FjGWK0wXy1Of18j07KVlkQeKJKGLkrFxccob89IcxTxMoh2C/IZseD
 IAssEDI4faDvGKmJnetcKkbyOxB6HiaEefhcEZiikmFX1GNRiXDZ16c7fidHDrhTI+vsLTqVkZR
 avsguwRhDbhVPBLU3Zb5G3jTzBUYbGpKWAUDka8jbMoRvNEQ4y5zW0SKJPwSphVxakWowTwJwJj
 /XbZnTyxvC1KM35/8X3uZ+rQYAn9OSPDWXQVNhGtQ9nh8pu+oGrKIF1vvdVgJmdxpoLzFwSLzHY
 VE4IdFc2xYkdtIz3MwKVxI5Ug2tWzNRmcbGPThpxa3hJ+qWXPrSbVtQf/03rlSkFm8kIGELmfvQ
 wWHSqRGHQBQYMnHJSNg==
X-Proofpoint-GUID: VHqVXchuYsoPGF8mngnx21ERCY7uX79u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050056
Subject: [Buildroot] [PATCH] boot/ti-k3-r5-loader: bump to version 2026.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release announcement:
   https://lists.u-boot-project.org/pipermail/u-boot/2026-October/634075.html

Exactly like with commit 747aa911f6a4 ("boot/uboot: bump to version
2026.10") all release artifacts for U-Boot have been migrated to the new
gitlab instance at git.u-boot-project.org, so we also need to update the
TI_K3_R5_LOADER_SITE to point to the new location.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/ti-k3-r5-loader/Config.in            | 4 ++--
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 7eb471e6d504..2dda271c2696 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -18,7 +18,7 @@ choice
 	  here as it is used to build the main U-Boot package.
 
 config BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
-	bool "2024.10"
+	bool "2026.10"
 
 config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	bool "Custom version"
@@ -62,7 +62,7 @@ endif
 
 config BR2_TARGET_TI_K3_R5_LOADER_VERSION
 	string
-	default "2024.10"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
+	default "2026.10"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
 	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
index af025a583e44..2142f0c67ca5 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 178db5c0f35a..382b82a00a59 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -26,7 +26,7 @@ TI_K3_R5_LOADER_SITE_METHOD = svn
 TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.gz
 else
 # Handle stable official U-Boot versions
-TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
+TI_K3_R5_LOADER_SITE = https://git.u-boot-project.org/u-boot/u-boot/-/releases/v$(TI_K3_R5_LOADER_VERSION)/downloads
 TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
 endif
 

---
base-commit: d1fad27e965805c0e4e201994021cd9acf48b0a5
change-id: 20261105-ti-k3-r5-loader-bump-a5fd9726c020

Best regards,
--  
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
